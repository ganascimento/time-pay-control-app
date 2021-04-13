import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/app/pages/home/home_controller.dart';
import 'package:timepaycontrol/shared/components/week_component.dart';
import 'package:timepaycontrol/shared/methods/calendar_methods.dart';
import 'package:timepaycontrol/shared/models/work_day_,model.dart';

import 'head_table_month_component.dart';

class MonthTableComponent extends StatefulWidget {
	final List<List<WorkDayModel>> workDays;
	final DateTime currentDate;

	MonthTableComponent({
		@required this.workDays,
		@required this.currentDate
	});

	@override
	_MonthTableComponentState createState() => _MonthTableComponentState();
}

class _MonthTableComponentState extends State<MonthTableComponent> {
	final calendarMethods = CalendarMethods();
	final homeController = Modular.get<HomeController>();

	@override
	Widget build(BuildContext context) {

		return Column(
		  children: [
				HeadTableMonthComponent(),
		    Column(			
		    	children: List.generate(
		    		widget.workDays.length,
		    		(index) {
							final week = widget.workDays[index];
							final weekModel = homeController.currentMonthWeek.firstWhere((x) => x.startDate == week[0].day);

							return WeekComponent(
								workDays: week,
								currentMonth: widget.currentDate.month,
								workWeek: weekModel
							);
						}
		    	)
		    ),
		  ],
		);
	}
}