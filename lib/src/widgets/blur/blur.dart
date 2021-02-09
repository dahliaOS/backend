import 'dart:ui';
import 'package:dahlia_backend/dahlia_backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Blur extends StatelessWidget {
  final Widget? child;
  final bool? useBlur;
  final BorderRadius? customBorderRadius;
  final double? customBlur;
  Blur(
      {Key? key,
      @required this.child,
      this.customBorderRadius,
      this.useBlur,
      this.customBlur})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _data = context.watch<PreferenceProvider>();
    return ClipRRect(
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(_data.borderRadius),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: (useBlur ?? true)
                  ? (customBlur ?? (_data.enableBlur ? _data.blur : 0.0))
                  : 0.0,
              sigmaY: (useBlur ?? true)
                  ? (customBlur ?? (_data.enableBlur ? _data.blur : 0.0))
                  : 0.0),
          child: child,
        ));
  }
}
