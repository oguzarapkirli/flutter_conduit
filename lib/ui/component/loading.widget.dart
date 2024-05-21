import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class LoadingWidget extends StatelessWidget {
  final int? size;
  final Color? color;
  const LoadingWidget({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      size: size?.toDouble() ?? 50.0,
      color: color ?? Theme.of(context).primaryColor,
    );
  }
}
