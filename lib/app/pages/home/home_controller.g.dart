// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentDateAtom = Atom(name: '_HomeControllerBase.currentDate');

  @override
  DateTime get currentDate {
    _$currentDateAtom.reportRead();
    return super.currentDate;
  }

  @override
  set currentDate(DateTime value) {
    _$currentDateAtom.reportWrite(value, super.currentDate, () {
      super.currentDate = value;
    });
  }

  final _$workDaysAtom = Atom(name: '_HomeControllerBase.workDays');

  @override
  List<List<WorkDayModel>> get workDays {
    _$workDaysAtom.reportRead();
    return super.workDays;
  }

  @override
  set workDays(List<List<WorkDayModel>> value) {
    _$workDaysAtom.reportWrite(value, super.workDays, () {
      super.workDays = value;
    });
  }

  final _$currentMonthWeekAtom =
      Atom(name: '_HomeControllerBase.currentMonthWeek');

  @override
  List<WorkWeekNodel> get currentMonthWeek {
    _$currentMonthWeekAtom.reportRead();
    return super.currentMonthWeek;
  }

  @override
  set currentMonthWeek(List<WorkWeekNodel> value) {
    _$currentMonthWeekAtom.reportWrite(value, super.currentMonthWeek, () {
      super.currentMonthWeek = value;
    });
  }

  final _$monthTextAtom = Atom(name: '_HomeControllerBase.monthText');

  @override
  String get monthText {
    _$monthTextAtom.reportRead();
    return super.monthText;
  }

  @override
  set monthText(String value) {
    _$monthTextAtom.reportWrite(value, super.monthText, () {
      super.monthText = value;
    });
  }

  final _$selectedWorkDayAtom =
      Atom(name: '_HomeControllerBase.selectedWorkDay');

  @override
  WorkDayModel get selectedWorkDay {
    _$selectedWorkDayAtom.reportRead();
    return super.selectedWorkDay;
  }

  @override
  set selectedWorkDay(WorkDayModel value) {
    _$selectedWorkDayAtom.reportWrite(value, super.selectedWorkDay, () {
      super.selectedWorkDay = value;
    });
  }

  final _$setWorkHourAsyncAction =
      AsyncAction('_HomeControllerBase.setWorkHour');

  @override
  Future setWorkHour(int hours) {
    return _$setWorkHourAsyncAction.run(() => super.setWorkHour(hours));
  }

  final _$setWorkWeekAsyncAction =
      AsyncAction('_HomeControllerBase.setWorkWeek');

  @override
  Future setWorkWeek(WorkWeekNodel data) {
    return _$setWorkWeekAsyncAction.run(() => super.setWorkWeek(data));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addMonth() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addMonth');
    try {
      return super.addMonth();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMonth() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeMonth');
    try {
      return super.removeMonth();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getWorkDays() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getWorkDays');
    try {
      return super.getWorkDays();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedDate(WorkDayModel workDay) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSelectedDate');
    try {
      return super.setSelectedDate(workDay);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentDate: ${currentDate},
workDays: ${workDays},
currentMonthWeek: ${currentMonthWeek},
monthText: ${monthText},
selectedWorkDay: ${selectedWorkDay}
    ''';
  }
}
