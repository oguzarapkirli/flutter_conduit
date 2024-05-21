import 'package:conduit/ui/component/loading.widget.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  bool get hasAppBar => appBar != null;
  final bool? isLoading;
  const AppScreen(
      {super.key, required this.child, this.appBar, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: isLoading ?? false
          ? const LoadingWidget()
          : Padding(
              padding: UIConstants.defaultPadding,
              child: child,
            ),
    );
  }
}
