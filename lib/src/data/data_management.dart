import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DatabaseManager {
  static late Box _hivedb;
  static Future<void> initialseDatabase() async {
    Hive.init('/tmp/dahlia');
    _hivedb = await Hive.openBox('settings');
  }

  //get
  ///Get the Value of a Key
  static dynamic get<T>(String key) => _hivedb.get(key);

  //set
  ///Set the Value of a Key
  static void set(String key, dynamic value) async =>
      await _hivedb.put(key, value);

  //new entry
  ///Checks if the Database already contains the entry and creates a new one if it doesn't
  static void newEntry(String key, dynamic value) {
    if (!(_hivedb.containsKey(key))) {
      set(key, value);
    }
  }

  //get DatabaseEntry
  ///returns the Hive Box
  static Box? get getHiveBox => _hivedb;
}

class PreferenceProvider extends ChangeNotifier {
  PreferenceProvider() {
    loadData();
  }

  //initial values
  double _blur = 25.0;
  double _borderRadius = 1.0;
  double _themeOpacity = 0.5;
  bool _darkMode = false;
  List<String> _packages = List.empty();
  String _iconPack = "io.dahlia.icons.default";
  String _wallpaper = "assets/images/wallpapers/Three_Bubbles.png";
  bool _centerTaskbar = true;
  bool _enableBlur = true;
  bool _randomWallpaper = false;
  int _accentColor = Colors.deepOrangeAccent.value;
  bool _enableDevOptions = false;
  bool _enableAutoTime = true;
  bool _showSeconds = false;
  bool _enable24h = true;
  String _keyboardLayoutName = "en_US";
  double _volumeLevel = 0.5;
  bool _enableBluelightFilter = false;
  double _brightness = 1.0;
  bool _wifi = true;
  bool _bluetooth = false;

  //getter
  double get blur => _blur;
  double get borderRadius => _borderRadius;
  double get themeOpacity => _themeOpacity;
  bool get darkMode => _darkMode;
  List<String> get packages => _packages;
  String get iconPack => _iconPack;
  String get wallpaper => _wallpaper;
  bool get centerTaskbar => _centerTaskbar;
  bool get enableBlur => _enableBlur;
  bool get randomWallpaper => _randomWallpaper;
  int get accentColor => _accentColor;
  bool get enableDevOptions => _enableDevOptions;
  bool get enableAutoTime => _enableAutoTime;
  bool get showSeconds => _showSeconds;
  bool get enable24h => _enable24h;
  String get keyboardLayoutName => _keyboardLayoutName;
  double get volumeLevel => _volumeLevel;
  bool get enableBluelightFilter => _enableBluelightFilter;
  double get brightness => _brightness;
  bool get wifi => _wifi;
  bool get bluetooth => _bluetooth;

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

  set themeOpacity(double opacity) {
    _themeOpacity = opacity;
    DatabaseManager.set("themeOpacity", opacity);
    notifyListeners();
  }

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    DatabaseManager.set("darkMode", darkMode);
    notifyListeners();
  }

  set packages(List<String> packages) {
    _packages = packages;
    DatabaseManager.set("packages", packages);
    notifyListeners();
  }

  set iconPack(String iconPack) {
    _iconPack = iconPack;
    DatabaseManager.set("iconPack", iconPack);
    notifyListeners();
  }

  set wallpaper(String path) {
    _wallpaper = path;
    DatabaseManager.set("wallpaper", path);
    notifyListeners();
  }

  set centerTaskbar(bool value) {
    _centerTaskbar = value;
    DatabaseManager.set("centerTaskbar", value);
    notifyListeners();
  }

  set enableBlur(bool value) {
    _enableBlur = value;
    DatabaseManager.set("enableBlur", value);
    notifyListeners();
  }

  set randomWallpaper(bool value) {
    _randomWallpaper = value;
    DatabaseManager.set("randomWallpaper", value);
    notifyListeners();
  }

  set accentColor(int value) {
    _accentColor = value;
    DatabaseManager.set("accentColor", value);
    notifyListeners();
  }

  set enableDevOptions(bool value) {
    _enableDevOptions = value;
    DatabaseManager.set("enableDeveloperOptions", value);
    notifyListeners();
  }

  set enableAutoTime(bool value) {
    _enableAutoTime = value;
    DatabaseManager.set("enableAutoTime", value);
    notifyListeners();
  }

  set showSeconds(bool value) {
    _showSeconds = value;
    DatabaseManager.set("showSeconds", value);
    notifyListeners();
  }

  set enable24h(bool value) {
    _enable24h = value;
    DatabaseManager.set("enable24h", value);
    notifyListeners();
  }

  set keyboardLayoutName(String value) {
    _keyboardLayoutName = value;
    DatabaseManager.set("keyboardLayoutName", value);
    notifyListeners();
  }

  set volumeLevel(double value) {
    _volumeLevel = value;
    DatabaseManager.set("volumeLevel", value);
    notifyListeners();
  }

  set enableBluelightFilter(bool value) {
    _enableBluelightFilter = value;
    DatabaseManager.set("enableBluelightFilter", value);
    notifyListeners();
  }

  set brightness(double value) {
    _brightness = value;
    DatabaseManager.set("brightness", value);
    notifyListeners();
  }

  set wifi(bool value) {
    _wifi = value;
    DatabaseManager.set("wifi", value);
    notifyListeners();
  }

  set bluetooth(bool value) {
    _bluetooth = value;
    DatabaseManager.set("bluetooth", value);
    notifyListeners();
  }

  //load from Database
  void loadData() {
    blur = DatabaseManager.get("blur") ?? blur;
    borderRadius = DatabaseManager.get("borderRadius") ?? borderRadius;
    themeOpacity = DatabaseManager.get("themeOpacity") ?? themeOpacity;
    darkMode = DatabaseManager.get("darkMode") ?? darkMode;
    packages = DatabaseManager.get("packages") ?? packages;
    iconPack = DatabaseManager.get("iconPack") ?? iconPack;
    wallpaper = DatabaseManager.get("wallpaper") ?? wallpaper;
    centerTaskbar = DatabaseManager.get("centerTaskbar") ?? centerTaskbar;
    enableBlur = DatabaseManager.get("enableBlur") ?? enableBlur;
    randomWallpaper = DatabaseManager.get("randomWallpaper") ?? randomWallpaper;
    accentColor = DatabaseManager.get("accentColor") ?? accentColor;
    enableDevOptions =
        DatabaseManager.get("enableDeveloperOptions") ?? enableDevOptions;
    enableAutoTime = DatabaseManager.get("enableAutoTme") ?? enableAutoTime;
    showSeconds = DatabaseManager.get("showSeconds") ?? showSeconds;
    enable24h = DatabaseManager.get("enable24h") ?? enable24h;
    keyboardLayoutName =
        DatabaseManager.get("keyboardLayoutName") ?? keyboardLayoutName;
    volumeLevel = DatabaseManager.get("volumeLevel") ?? volumeLevel;
    enableBluelightFilter =
        DatabaseManager.get("enableBluelightFilter") ?? enableBluelightFilter;
    brightness = DatabaseManager.get("brightness") ?? brightness;
    wifi = DatabaseManager.get("wifi") ?? wifi;
    bluetooth = DatabaseManager.get("bluetooth") ?? bluetooth;
  }
}
