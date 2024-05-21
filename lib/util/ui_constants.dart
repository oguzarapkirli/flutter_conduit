import 'package:flutter/material.dart';

class UIConstants {
  static const smallValue = 8.0;
  static const mediumValue = 16.0;
  static const largeValue = 24.0;
  static const extraLargeValue = 32.0;

  static const smallPadding = EdgeInsets.all(smallValue);
  static const mediumPadding = EdgeInsets.all(mediumValue);
  static const largePadding = EdgeInsets.all(largeValue);
  static const extraLargePadding = EdgeInsets.all(extraLargeValue);

  static final smallBorderRadius = BorderRadius.circular(smallValue);
  static final mediumBorderRadius = BorderRadius.circular(mediumValue);
  static final largeBorderRadius = BorderRadius.circular(largeValue);
  static final extraLargeBorderRadius = BorderRadius.circular(extraLargeValue);

  static const defaultMarginSize = 12.0;
  static const defaultHorizontalMargin =
      EdgeInsets.symmetric(horizontal: defaultMarginSize);
  static const defaultMargin = EdgeInsets.all(defaultMarginSize);
  static const defaultPadding =
      EdgeInsets.symmetric(horizontal: defaultMarginSize, vertical: smallValue);
}
