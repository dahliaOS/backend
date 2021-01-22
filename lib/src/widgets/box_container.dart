import 'package:dahlia_backend/src/widgets/blur/blur.dart';
import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget? child;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;

  BoxContainer({
    this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.color,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Blur(
        child: Container(
      width: width,
      height: height,
      color: color,
      padding: padding,
      margin: margin,
      child: child,
    ));
  }
}
