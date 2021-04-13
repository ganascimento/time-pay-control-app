import 'package:flutter/material.dart';
import 'package:timepaycontrol/shared/components/day_component.dart';
import 'package:timepaycontrol/shared/models/work_day_,model.dart';
import 'package:timepaycontrol/shared/models/work_week_model.dart';

import 'btn_select_week.dart';

class WeekComponent extends StatefulWidget {
	final List<WorkDayModel> workDays;
	final int currentMonth;
	final WorkWeekNodel workWeek;
	
	WeekComponent({
		@required this.workDays,
		@required this.currentMonth,
		@required this.workWeek
	});

	@override
	_WeekComponentState createState() => _WeekComponentState();
}

class _WeekComponentState extends State<WeekComponent> {
	@override
	Widget build(BuildContext context) {
		final currentDate = DateTime.now();
		int hoursWeek = 0;
		final validDays = widget.workDays.where((x) => x.workHours != null && x.workHours > 0)?.map((x) => x.workHours);

		if (validDays.length > 0) {
			hoursWeek = validDays.reduce((value, element) => value + element);
		}

		return Row(
			children: [
				BtnSelectWeek(
					workWeek: widget.workWeek,
					hours: hoursWeek,
				),
				Row(
					children: List.generate(
						widget.workDays.length,
						(index) {
							final workDays = widget.workDays[index];

							return DayComponent(
								workDay: workDays,
								isCurrentMonth: workDays.day.month == widget.currentMonth,
								isCurrentDay: workDays.day.day == currentDate.day && workDays.day.month == currentDate.month && workDays.day.year == currentDate.year,
							);
						}
					)
				)
			],
		);
	}
}