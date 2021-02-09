import 'package:dahlia_backend/src/data/data_management.dart';
import 'package:dahlia_backend/src/widgets/blur/blur.dart';
import 'package:flutter/material.dart';
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
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _data = context.read<PreferenceProvider>();
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(borderRadius: customBorderRadius),
      child: Blur(
        useBlur: useBlur ?? true,
        customBlur: customBlur,
        customBorderRadius: customBorderRadius,
        child: Container(
          child: child,
          padding: padding,
          color:
              useSystemOpacity ? color?.withOpacity(_data.themeOpacity) : color,
        ),
      ),
    );
  }
}
