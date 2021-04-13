import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/app/pages/home/home_controller.dart';

class FormComponent extends StatefulWidget {
	@override
	_FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
	final textController = TextEditingController();
	final homeController = Modular.get<HomeController>();

	onTapBtn() {
			int hours = textController.text != null && textController.text.isNotEmpty ? int.parse(textController.text) : null;
			homeController.setWorkHour(hours);
	}

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;
		textController.text = homeController.selectedWorkDay.workHours != null ? homeController.selectedWorkDay.workHours?.toString() : '';

		return Column(
			children: [
				Container(
					margin: EdgeInsets.only(top: size.height * 0.04, bottom: 30),
				  child: Text(
				  	"Cadastro de horas",
				  	style: TextStyle(
							fontSize: 18,
							fontWeight: FontWeight.bold
				  	),
				  ),
				),
				Container(
					margin: EdgeInsets.only(bottom: size.height * 0.05),
					width: size.width * 0.7,
					alignment: Alignment.center,
				  child: TextField(
						controller: textController,
				  	keyboardType: TextInputType.number,						
						decoration: InputDecoration(
							labelText: "Horas trabalhadas",
							contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
							border: OutlineInputBorder(
								borderSide: BorderSide(color: Colors.teal)
							)
						)
				  )
				),
				Material(
					color: Colors.green,
					borderRadius: BorderRadius.circular(7),
					child: InkWell(
						borderRadius: BorderRadius.circular(7),
						onTap: onTapBtn,
						child: Container(
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(7),
							),
							alignment: Alignment.center,
							width: size.width * 0.6,
							height: 45,
							child: Text(
								"Cadastrar",
								style: TextStyle(
									color: Colors.white,
									fontSize: 18,
									fontWeight: FontWeight.bold
								),
							),
						),
					),
				),
				Container(margin: EdgeInsets.only(bottom: size.height * 0.03))
			]
		);
	}
}