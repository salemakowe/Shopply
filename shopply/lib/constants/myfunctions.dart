import 'package:flutter/material.dart';
import 'package:shopply/constants/mysizes.dart';

EdgeInsets internalPadding(
  BuildContext context, {
  double? top,
  double? bottom,
  double? right,
  double? left,
}) {
  Sizes().heightSizeCalc(context);
  Sizes().widthSizeCalc(context);
  return EdgeInsets.only(
      top: top ?? Sizes.h15,
      bottom: bottom ?? Sizes.h15,
      right: right ?? Sizes.w20,
      left: left ?? Sizes.w20);
}
