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
import 'package:dahlia_backend/src/data/data_management.dart';
import 'package:dahlia_backend/src/widgets/blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BoxContainer extends StatelessWidget {
  final Widget? child;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final bool? useBlur;
  final BorderRadius? customBorderRadius;
  final bool useSystemOpacity;
  final double? customBlur;
  final SystemMouseCursor cursor;
  final BoxDecoration? decoration;
  final Clip? clipBehavior;

  BoxContainer({
    this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.color,
    this.useBlur,
    this.customBorderRadius,
    this.customBlur,
    this.useSystemOpacity = false,
    this.cursor = SystemMouseCursors.basic,
    this.decoration,
    this.clipBehavior,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _data = context.read<PreferenceProvider>();
    return MouseRegion(
      cursor: cursor,
      child: Container(
        clipBehavior: clipBehavior ?? Clip.antiAlias,
        width: width,
        height: height,
        margin: margin,
        decoration: decoration?.copyWith(borderRadius: customBorderRadius) ??
            BoxDecoration(borderRadius: customBorderRadius),
        child: Blur(
          useBlur: useBlur ?? true,
          customBlur: customBlur,
          customBorderRadius: customBorderRadius,
          child: Container(
            padding: padding,
            color: useSystemOpacity
                ? color?.withOpacity(_data.themeOpacity)
                : color,
            child: child,
          ),
        ),
      ),
    );
  }
}
