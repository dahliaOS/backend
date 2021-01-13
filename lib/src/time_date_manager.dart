import 'dart:cli';

import 'package:dahlia_backend/src/database_manager.dart';
import 'package:intl/intl.dart';

class DateTimeManager {
  static String? _time;
  static String? _date;
  static void initialiseScheduler() {
    //TODO create an initalisation for the default format
    //setTimeFormat('12h+S');
    //setDateFormat("dd.MM.yyyy");
    while (true) {
      formatTime();
      formatDate();
      waitFor(Future.delayed(Duration(seconds: 1)));
    }
  }

  //getTime
  ///returns the Time with the selected format
  ///eg. 11:30 am | 16:20
  static String? getTime() => _time;

  //getDate
  ///returns the Date with the selected format
  ///eg. 24.12.2021 | 12/24/2021
  static String? getDate() => _date;

  //format the Data
  static void formatDate() {
    _date =
        DateFormat(DatabaseManager.get('dateFormat')).format(DateTime.now());
  }

  //format the time
  static void formatTime() {
    switch (DatabaseManager.get('timeFormat')) {
      case '12h':
        _time = DateFormat.jm().format(DateTime.now());
        break;
      case '24h':
        _time = DateFormat.Hm().format(DateTime.now());
        break;
      case '12h+s':
        _time = DateFormat.jms().format(DateTime.now());
        break;
      case '24h+s':
        _time = DateFormat.Hms().format(DateTime.now());
        break;
      default:
        _time = DateFormat.Hms().format(DateTime.now());
        break;
    }
  }

  //setTimeFormat
  /// Choose the time format:
  /// am/pm:  "12h"
  /// 24hr:       "24h"
  /// am/pm with seconds: "12h+s"
  /// 24hr with seconds: "24h+s"
  static void setTimeFormat(String format) {
    DatabaseManager.set('timeFormat', format.toLowerCase());
  }

  //setDateFormat
  ///Choose a time format
  ///More information: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
  static void setDateFormat(String format) {
    DatabaseManager.set('dateFormat', format);
  }
}
