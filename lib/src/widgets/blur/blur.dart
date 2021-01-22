import 'dart:ui';
import 'package:dahlia_backend/src/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Blur extends StatelessWidget {
  final Widget? child;
  Blur({
    Key? key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _data = context.watch<DatabaseProvider>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(_data.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _data.blur, sigmaY: _data.blur),
        child: child,
      ),
    );
  }
}
