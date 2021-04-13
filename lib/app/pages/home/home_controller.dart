import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/shared/db/hive_db.dart';
import 'package:timepaycontrol/shared/methods/calendar_methods.dart';
import 'package:timepaycontrol/shared/methods/date_methods.dart';
import 'package:timepaycontrol/shared/models/work_day_,model.dart';
import 'package:timepaycontrol/shared/models/work_week_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
	HiveDb _db = HiveDb();
	List<WorkDayModel> _dataDays = [];
	List<WorkWeekNodel> _dataWeek = [];

	_HomeControllerBase() {
		_dataDays = _db.getWorkDays();
		_dataWeek = _db.getWorkWeek();
	}

	@observable
	DateTime currentDate = DateTime.now();

	@observable
	List<List<WorkDayModel>> workDays = [];

	@observable
	List<WorkWeekNodel> currentMonthWeek = [];

	@observable
	String monthText = '';

	@observable
	WorkDayModel selectedWorkDay;

	@action
  addMonth() {
		currentDate = DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
		getWorkDays();
	}

	@action
	removeMonth() {
		currentDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
		getWorkDays();
	}

	@action
	getWorkDays() {
		currentMonthWeek = [];
		final localWorks = <WorkDayModel>[];
		final dateMethods = DateMethods();
		final calendarMethods = CalendarMethods();		
		final days = calendarMethods.createDayList(currentDate.month, currentDate.year);

		days.forEach((item) {
			if (_dataDays.where((x) => x.day == item).length > 0) {
				localWorks.add(_dataDays.firstWhere((x) => x.day == item));
			}
			else localWorks.add(WorkDayModel(day: item, isWorked: false));
		});

		monthText = dateMethods.getDayText(currentDate);
		workDays = calendarMethods.partition(localWorks, 7).cast<List<WorkDayModel>>();

		workDays.forEach((week) {
			final startDate = week[0].day;
			final endDate = week[week.length - 1].day;
			final localWeekModel = _dataWeek != null && _dataWeek.length > 0 ? _dataWeek.firstWhere((x) => x.startDate == startDate && x.endDate == endDate, orElse: () => null) : null;

			this.currentMonthWeek.add(WorkWeekNodel(
				startDate: startDate,
				endDate: endDate,
				isPaid: localWeekModel != null ? localWeekModel.isPaid : false
			));
		});
	}

	@action
	setSelectedDate(WorkDayModel workDay) {
		if (selectedWorkDay?.day != workDay.day)
			selectedWorkDay = workDay;
		else
			selectedWorkDay = null;
	}

	@action
	setWorkHour(int hours) async {
		selectedWorkDay.workHours = hours;
		selectedWorkDay.isWorked = hours != null && hours != 0 ? true : false;

		_dataDays.add(selectedWorkDay);
		await _db.setWorkDays(_dataDays);
		getWorkDays();
	}

	@action
	setWorkWeek(WorkWeekNodel data) async {
		data.isPaid = !data.isPaid;

		if (_dataWeek.any((x) => x.startDate == data.startDate && x.endDate == data.endDate))
			_dataWeek[_dataWeek.indexWhere((x) => x.startDate == data.startDate && x.endDate == data.endDate)] = data;
		else 
			_dataWeek.add(data);

		await _db.setWorkWeek(_dataWeek);
		getWorkDays();
	}
}
