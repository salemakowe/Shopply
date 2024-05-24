import 'package:flutter/material.dart';

Widget customDivider({double? height, Color? color, double? thickness}) {
  return SizedBox(
    height: height ?? 1,
  );
}

Widget customhorizontal({double? width}) {
  return SizedBox(
    width: width ?? 1,
  );
}
