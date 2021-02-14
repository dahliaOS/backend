/*
Copyright 2021 The dahliaOS Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import 'dart:async';
import 'package:dahlia_backend/dahlia_backend.dart';
import 'package:intl/intl.dart';

class DateTimeManager {
  static String? _time;
  static String? _date;
  static void initialiseScheduler() async {
    //TODO create an initalisation for the default format
    //setTimeFormat('12h+S');
    //setDateFormat("dd.MM.yyyy");
    while (true) {
      formatTime();
      formatDate();
      await Future.delayed(Duration(seconds: 1));
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
