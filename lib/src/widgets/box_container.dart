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

import 'package:dahlia_backend/src/widgets/acrylic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoxSurface extends StatelessWidget {
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadius borderRadius;
  final Widget? child;
  final double? width, height;
  final bool outline;
  const BoxSurface({
    Key? key,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.outline = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _darkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      foregroundDecoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          // Set border radius of the surface area
          borderRadius: borderRadius,
          // Create outline around the surface
          side: outline
              ? BorderSide(
                  color: _darkMode
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.2),
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Acrylic(
          opacity: 0.65,
          blurRadius: 16,
          color: Theme.of(context).backgroundColor,
          child: child,
        ),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadius borderRadius;
  final Widget? child;
  final double? width, height;
  final bool outline;
  const BoxContainer({
    Key? key,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.outline = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _darkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      foregroundDecoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          // Set border radius of the surface area
          borderRadius: borderRadius,
          // Create outline around the surface
          side: outline
              ? BorderSide(
                  color: _darkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.2),
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Acrylic(
          opacity: 0.4,
          blurRadius: 16,
          color: Theme.of(context).backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
