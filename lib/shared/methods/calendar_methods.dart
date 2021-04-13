import 'package:date_util/date_util.dart';

class CalendarMethods {
	List<DateTime> createDayList(int month, int year) {
		var days = <DateTime>[];

		days.addAll(this._getCompleteStartMoth(month, year).reversed);
		days.addAll(this._getCurrentDays(month, year));
		days.addAll(this._getCompleteEndMonth(month, year));

		return days;
	}

	List<DateTime> _getCurrentDays(int month, int year) {
		var days = <DateTime>[];
		var ultilDays = this._getUltilDays(month, year);

		for (int i = 1; i <= ultilDays; i++) {
			final dateToAdd = this._parseDate(i, month, year);
			days.add(dateToAdd);
		}

		return days;
	}

	List<DateTime> _getCompleteStartMoth(int month, int year) {
		var days = <DateTime>[];
		final weekday = this._parseDate(1, month, year).weekday;

		if (weekday == 7) return days;

		final previousDate = this._getPreviousDate(month, year);
		final lastMonthUltilDays = this._getUltilDays(previousDate.month, previousDate.year);

		for (int i = 0; i < weekday; i++) {
			final currentDay = lastMonthUltilDays - i;
			final dateToAdd = this._parseDate(currentDay, previousDate.month, previousDate.year);
			days.add(dateToAdd);
		}

		return days;
	}

	List<DateTime> _getCompleteEndMonth(int month, int year) {
		var days = <DateTime>[];
		final ultilDays = this._getUltilDays(month, year);
		final weekday = this._parseDate(ultilDays, month, year).weekday;

		if (weekday == 6) return [];

		var nextDate = this._getLatesDate(month, year);

		for (int i = nextDate.weekday; i <= 6; i++) {
			days.add(nextDate);
			nextDate = nextDate.add(Duration(days: 1));
		}

		return days;
	}

	int _getUltilDays(int month, int year) {
		final dateUtility = DateUtil();
		return dateUtility.daysInMonth(month, year);
	}

	DateTime _getPreviousDate(int month, int year) {
		final date = this._parseDate(1, month, year);
		return date.subtract(Duration(days: 1));
	}

	DateTime _getLatesDate(int month, int year) {
		final lastDay = this._getUltilDays(month, year);
		final date = this._parseDate(lastDay, month, year);
		return date.add(Duration(days: 1));
	}

	DateTime _parseDate(int day, int month, int year) {
		final dayString = day > 9 ? day.toString() : '0$day';
		final monthString = month > 9 ? month.toString() : '0$month';

		return DateTime.tryParse('$year-$monthString-$dayString');
	}

	List<dynamic> partition(List items, int size) {
		var chunks = [];
		for (var i = 0; i < items.length; i += size) {
			chunks.add(items.sublist(i, i+size > items.length ? items.length : i + size)); 
		}
		return chunks;
	}
}