class WorkDayModel {
	DateTime day;
	bool isWorked;
	int workHours;

	WorkDayModel({
		this.day,
		this.isWorked,
		this.workHours
	});

	factory WorkDayModel.fromJson(Map<String, dynamic> json) {
		return WorkDayModel(
			day: DateTime.tryParse(json['day']),
			isWorked: json['isWorked'],
			workHours: json['workHours']
		);
	}

	static List<WorkDayModel> fromJsonArray(List<dynamic> json) {
		return json.map((item) => WorkDayModel.fromJson(item)).toList();
	}

	Map<String, dynamic> toJson() {
		Map<String, dynamic> data = {
			'day': this.day.toString(),
			'isWorked': this.isWorked,
			'workHours': this.workHours
		};

		return data;
	}
}