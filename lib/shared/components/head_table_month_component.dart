import 'package:flutter/material.dart';
import 'package:timepaycontrol/shared/methods/date_methods.dart';

class HeadTableMonthComponent extends StatefulWidget {
	@override
	_HeadTableMonthComponentState createState() => _HeadTableMonthComponentState();
}

class _HeadTableMonthComponentState extends State<HeadTableMonthComponent> {	
	final dateMethods = DateMethods();

	Widget defaultWidget(Size size, { int weekday }) {
		return Container(
			width: size.width / 8,
			height: size.height * 0.04,
			alignment: Alignment.center,
			decoration: BoxDecoration(
				border: weekday != null ? 
					Border(
						bottom: BorderSide(width: 1, color: Colors.grey[400])
					) :
					null
			),
			child: weekday != null ? 
				Text(
					dateMethods.getMonthShortText(weekday),
					style: TextStyle(
						fontSize: 11
					),
				) :
				Container()
		);
	}

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return Row(
			children: [
				defaultWidget(size),
				defaultWidget(size, weekday: 7),
				defaultWidget(size, weekday: 1),
				defaultWidget(size, weekday: 2),
				defaultWidget(size, weekday: 3),
				defaultWidget(size, weekday: 4),
				defaultWidget(size, weekday: 5),
				defaultWidget(size, weekday: 6),
			],
		);
	}
}