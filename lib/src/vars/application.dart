import 'package:flutter/widgets.dart';

class Application {
  final String? name, version, description;
  final Widget? app;
  final ApplicationCategory? category;
  final bool isTest;
  final String? iconName;
  const Application(
      {@required this.app,
      this.category,
      this.description,
      this.iconName,
      @required this.name,
      this.isTest = false,
      this.version});
  const Application.testing(
      {@required this.app,
      this.category = ApplicationCategory.TESTING,
      this.description = "TESING APP",
      this.iconName,
      @required this.name,
      this.isTest = true,
      this.version = "TEST"});
}

enum ApplicationCategory {
  INTERNET,
  MEDIA,
  GAMING,
  DEVELOPMENT,
  SYSTEM,
  OFFICE,
  TESTING
}
