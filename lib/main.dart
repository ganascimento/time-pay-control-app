import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timepaycontrol/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:timepaycontrol/app/app_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timepaycontrol/shared/constants/db_constant.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
	await Hive.openBox(DbConstants.boxWorkDays);
	await Hive.openBox(DbConstants.boxWorkWeeks);
	runApp(ModularApp(module: AppModule(), child: AppWidget()));
}