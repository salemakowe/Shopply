import 'package:flutter/material.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';

class MyWidget {
  Widget button({
    required BuildContext context,
    required Function proceed,
    Color? buttonColor,
    Color? buttonTextColor,
    Color? bordercolor,
    String? buttonText,
    double? buttonTextSize,
    double? curve,
    double? boxHeight,
    double? boxWidth,
    Icon? icon,
    bool? useDefaultStyle,
  }) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Center(
      child: SizedBox(
        height: boxHeight ?? Sizes.h50,
        width: boxWidth ?? double.infinity,
        child: ElevatedButton(
          onPressed: () {
            proceed();
          },
          style: MyDecor().buttonDecor(
              context: context,
              bordercurver: Sizes.w10,
              buttoncolor: buttonColor ?? MyColors.mainColor.withOpacity(.8),
              bordercolor: bordercolor ?? MyColors.mainColor.withOpacity(.8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon, const SizedBox(width: 8)],
              Text(
                buttonText ?? 'Proceed',
                textScaler: TextScaler.linear(textScale),
                style: useDefaultStyle == true
                    ? TextStyle(
                        fontSize: buttonTextSize ?? Sizes.w20,
                        color: buttonTextColor ?? Colors.white,
                        fontWeight: FontWeight.w500)
                    : MyDecor().textstyle(
                        fontsize: buttonTextSize ?? Sizes.w20,
                        fontcolor: buttonTextColor ?? Colors.white,
                        fontweight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
