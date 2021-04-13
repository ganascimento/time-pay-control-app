class WorkWeekNodel {
	DateTime startDate;
	DateTime endDate;
	bool isPaid;

	WorkWeekNodel({
		this.endDate,
		this.isPaid,
		this.startDate
	});

	factory WorkWeekNodel.fromJson(Map<String, dynamic> json) {
		return WorkWeekNodel(
			startDate: DateTime.tryParse(json['startDate']),
			endDate: DateTime.tryParse(json['endDate']),
			isPaid: json['isPaid']
		);
	}

	static List<WorkWeekNodel> fromJsonArray(List<dynamic> json) {
		return json.map((item) => WorkWeekNodel.fromJson(item)).toList();
	}

	Map<String, dynamic> toJson() {
		Map<String, dynamic> data = {
			'startDate': this.startDate.toString(),
			'endDate': this.endDate.toString(),
			'isPaid': this.isPaid
		};

		return data;
	}
}