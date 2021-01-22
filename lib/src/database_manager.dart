// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DatabaseManager {
  static Box<dynamic>? _hivedb;
  static Future<void> initialseDatabase() async {
    Hive.init('/tmp/hive');
    _hivedb = await Hive.openBox('database');
  }

  //get
  ///Get the Value of a Key
  static dynamic get(String key) => _hivedb?.get(key);

  //set
  ///Set the Value of a Key
  static void set(String key, dynamic value) => _hivedb?.put(key, value);

  //new entry
  ///Checks if the Database already contains the entry and creates a new one if it doesn't
  static void newEntry(String key, dynamic value) {
    if (!(_hivedb?.containsKey(key) ?? false)) {
      set(key, value);
    }
  }

  //get DatabaseEntry
  ///returns the Hive Box
  static Box? get getHiveBox => _hivedb;
}

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    init();
  }

  void init() async {
    await DatabaseManager.initialseDatabase();
    await loadData();
  }

  //initial values
  double _blur = 1.0;
  double _borderRadius = 1.0;

  //getter
  double get blur => _blur;
  double get borderRadius => _borderRadius;

  //setter
  set blur(double blur) {
    _blur = blur;
    DatabaseManager.set("blur", blur);
    notifyListeners();
  }

  set borderRadius(double borderRadius) {
    _borderRadius = borderRadius;
    DatabaseManager.set("borderRadius", borderRadius);
    notifyListeners();
  }

  //load from Database
  Future<void> loadData() async {
    blur = DatabaseManager.get("blur");
    borderRadius = DatabaseManager.get("borderRadius");
  }
}
