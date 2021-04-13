import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/shared/components/form_component.dart';
import 'package:timepaycontrol/shared/components/month_table_component.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {	
	@override
  void initState() {
		controller.getWorkDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
					builder: (_) => Text(controller.monthText),
				),
				actions: [
					IconButton(
						icon: Icon(Icons.arrow_back_ios),
						onPressed: () {
							controller.removeMonth();
						}
					),
					IconButton(
						icon: Icon(Icons.arrow_forward_ios),
						onPressed: () {
							controller.addMonth();
						}
					)
				],
      ),
      body: ListView(
        children: <Widget>[
					Observer(
						builder: (_) {
							return MonthTableComponent(
								workDays: controller.workDays,
								currentDate: controller.currentDate,
							);
						},
					),
					Observer(
						builder: (_) => controller.selectedWorkDay != null ? FormComponent() : Container()
					)
				],
      ),
    );
  }
}
