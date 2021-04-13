import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:timepaycontrol/shared/constants/db_constant.dart';
import 'package:timepaycontrol/shared/models/work_day_,model.dart';
import 'package:timepaycontrol/shared/models/work_week_model.dart';

class HiveDb {
	List<WorkDayModel> getWorkDays() {
		final box = Hive.box(DbConstants.boxWorkDays);
		final data = box.get(DbConstants.keyWorkDays);

		if (data != null) {
			final json = jsonDecode(data);
			final model = WorkDayModel.fromJsonArray(json);

			return model;
		}

		return [];
	}

	Future setWorkDays(List<WorkDayModel> model) async {
		final box = Hive.box(DbConstants.boxWorkDays);
		final data = model.map((item) => item.toJson()).toList();

		await box.put(DbConstants.keyWorkDays, jsonEncode(data));
	}

	List<WorkWeekNodel> getWorkWeek() {
		final box = Hive.box(DbConstants.boxWorkWeeks);
		final data = box.get(DbConstants.keyWorkWeeks);

		if (data != null) {
			final json = jsonDecode(data);
			final model = WorkWeekNodel.fromJsonArray(json);

			return model;
		}

		return [];
	}

	Future setWorkWeek(List<WorkWeekNodel> model) async {
		final box = Hive.box(DbConstants.boxWorkWeeks);
		final data = model.map((item) => item.toJson()).toList();

		await box.put(DbConstants.keyWorkWeeks, jsonEncode(data));
	}
}