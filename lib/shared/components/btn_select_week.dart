import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/app/pages/home/home_controller.dart';
import 'package:timepaycontrol/shared/models/work_week_model.dart';

class BtnSelectWeek extends StatefulWidget {
	final WorkWeekNodel workWeek;
	final int hours;

	BtnSelectWeek({
		@required this.workWeek,
		@required this.hours
	});

	@override
	_BtnSelectWeekState createState() => _BtnSelectWeekState();
}

class _BtnSelectWeekState extends State<BtnSelectWeek> {
	final homeController = Modular.get<HomeController>();
	
	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;
		var color = Colors.white;

		setWorkWeek() {
			homeController.setWorkWeek(widget.workWeek);
		}

		infoHours() {
			showDialog(
				context: context,
				builder: (_) {
					return AlertDialog(
						title: Text("Horas trabalhadas"),
						content: Text(widget.hours.toString()),
						actions: [
							TextButton(
								onPressed: () {
									Navigator.pop(context);
								},
								child: Text("Ok"),
							)
						],
					);
				}
			);
		}

		if (widget.workWeek.isPaid == true) 
			color = Colors.green[200];

		return Material(
			color: color,
		  child: InkWell(
				onTap: setWorkWeek,
				onLongPress: infoHours,
		    child: Container(
		    	alignment: Alignment.center,
		    	width: size.width * 0.125,
		    	height: size.height * 0.07,
		    	child: Icon(Icons.handyman),
		    ),
		  ),
		);
	}
}