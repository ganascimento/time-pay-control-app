import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/app/pages/home/home_controller.dart';
import 'package:timepaycontrol/shared/models/work_day_,model.dart';

class DayComponent extends StatefulWidget {
	final WorkDayModel workDay;
	final bool isCurrentMonth;
	final bool isCurrentDay;

	DayComponent({
		@required this.workDay,
		@required this.isCurrentMonth,
		@required this.isCurrentDay
	});

	@override
	_DayComponentState createState() => _DayComponentState();
}

class _DayComponentState extends State<DayComponent> {
	final controller = Modular.get<HomeController>();

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return Observer(
			builder: (_) {
				var color = Colors.white;

				if (widget.workDay.isWorked && controller.selectedWorkDay?.day == widget.workDay.day) color = Colors.green[300];
				else if (widget.workDay.isWorked) color = Colors.green[100];
				else if (controller.selectedWorkDay?.day == widget.workDay.day) color = Colors.orange[200];
				else if (widget.isCurrentDay) color = Colors.blue[100];
				else if (!widget.isCurrentMonth) color = Colors.grey[300];

				return Material(
					color: color,
					child: InkWell(
						onTap: () {
							controller.setSelectedDate(widget.workDay);
						},
						child: Container(
							decoration: BoxDecoration(							
								border: Border(
									bottom: BorderSide(width: 1, color: Colors.grey[400]),
									left: BorderSide(width: 1, color: Colors.grey[400])
								)
							),
							alignment: Alignment.center,
							width: size.width * 0.125,
							height: size.height * 0.07,
							child: Text(
								widget.workDay.day.day.toString(),
								style: TextStyle(
									color: widget.workDay.day.weekday == 7 && widget.isCurrentMonth ? Colors.red : Colors.black
								)
							)
						)
					)
				);
			},
		);
	}
}