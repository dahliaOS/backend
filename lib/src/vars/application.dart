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
