import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataHelper {
  final BuildContext context;
  final String startKey;
  final String stopKey;
  late SharedPreferences sharedPreferences;

  DataHelper(
      {required this.context,
      required this.startKey,
      required this.stopKey,
      required this.sharedPreferences})
      : _START_TIME_KEY = startKey,
        _STOP_TIME_KEY = stopKey,
        _COUNTING_KEY = '$startKey counting' {
    initSharedPreference();
    // _timerCounting =sharedPreferences.getBool(_COUNTING_KEY,false);
  }

  final String _START_TIME_KEY;
  final String _COUNTING_KEY;
  final String _STOP_TIME_KEY;

  var _dateFormat = DateFormat('MM/dd/yyyy HH:mm:ss', 'en_US');
  bool _timerCounting = false;
  DateTime? _startTime;
  DateTime? _stopTime;

  Future<void> initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void init() async {
    _timerCounting = sharedPreferences.getBool(_COUNTING_KEY) ?? false;

    String? startString = sharedPreferences.getString(_START_TIME_KEY);
    if (startString != null) {
      _startTime = _dateFormat.parse(startString);
    }

    String? stopString = sharedPreferences.getString(_STOP_TIME_KEY);
    if (stopString != null) {
      _stopTime = _dateFormat.parse(stopString);
    }
  }

  Future<bool> getBoolData(SharedPreferences prefs, String key) async {
    return prefs.getBool(key) ?? false;
  }

  DateTime? startTime() => _startTime;

  Future<DateTime?> startTimeFromPref() async {
    String startString = sharedPreferences.getString(_START_TIME_KEY) ?? '';
    return _dateFormat.parse(startString);
  }

  void setStartTime(DateTime? date) {
    _startTime = date;
    final stringDate = date == null ? null : _dateFormat.format(date);
    sharedPreferences.setString(_START_TIME_KEY, stringDate ?? '');
  }

  DateTime? stopTime() => _stopTime;

  void setStopTime(DateTime? date) {
    _startTime = date;
    final stringDate = date == null ? null : _dateFormat.format(date);
    sharedPreferences.setString(_STOP_TIME_KEY, stringDate ?? '');
  }

  bool timerCounting() => _timerCounting;

  void setTimerCounting(bool value) {
    _timerCounting = value;
    sharedPreferences.setBool(_COUNTING_KEY, value);
  }
}

class TimerManager {
  final DataHelper dataHelper;

  TimerManager({required this.dataHelper});

  void startTimer() {
    dataHelper.setTimerCounting(true);
  }

  void stopTimer() {
    dataHelper.setTimerCounting(false);
  }

  void resetAction(String text) {
    dataHelper.setStopTime(null);
    dataHelper.setStartTime(null);
    stopTimer();
    text = timeStringFromMilliseconds(0);
  }

  void startStopAction(
      {bool isFollow = false, DateTime? startTime, DateTime? endTime}) {
    if (dataHelper.timerCounting()) {
      dataHelper.setStopTime(DateTime.now());
      stopTimer();
    } else {
      if (dataHelper.stopTime() != null) {
        dataHelper.setStartTime(calcRestartTime(
            isFollow: isFollow, startTime: startTime, endTime: endTime));
        dataHelper.setStopTime(null);
      } else {
        dataHelper.setStopTime(null);
      }
      startTimer();
    }
  }

  DateTime calcRestartTime(
      {bool isFollow = false, DateTime? startTime, DateTime? endTime}) {
    int diff = isFollow
        ? (startTime?.millisecondsSinceEpoch ?? 0) -
            (endTime?.millisecondsSinceEpoch ?? 0)
        : (dataHelper.startTime())?.millisecondsSinceEpoch ??
            0 - (dataHelper.stopTime()?.millisecondsSinceEpoch ?? 0);

    return DateTime.now().add(Duration(milliseconds: diff));
  }

  void updateTime(
      {bool isFollow = false, DateTime? startTime, String text = ''}) {
    if (dataHelper.timerCounting()) {
      int time = DateTime.now().millisecondsSinceEpoch -
          (isFollow
              ? (startTime?.millisecondsSinceEpoch ?? 0)
              : (dataHelper.startTime()?.millisecondsSinceEpoch ?? 0));
      text = timeStringFromMilliseconds(time);
    }
  }

  String timeStringFromMilliseconds(int ms) {
    int seconds = (ms ~/ 1000) % 60;
    int minutes = (ms ~/ (1000 * 60)) % 60;
    int hours = (ms ~/ (1000 * 60 * 60)) % 24;
    int days = (ms ~/ (1000 * 60 * 60 * 24));

    return '${days.toString().padLeft(2, '0')}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
