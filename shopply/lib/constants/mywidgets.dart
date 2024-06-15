import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';

class MyWidget {
  button({
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
    Widget? icon,
    bool? useDefaultStyle,
    double? letterspace,
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
            bordercolor: bordercolor ?? MyColors.mainColor.withOpacity(.8),
          ),
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
                        fontWeight: FontWeight.w500,
                      )
                    : MyDecor().textstyle(
                        fontsize: buttonTextSize ?? Sizes.w20,
                        fontcolor: buttonTextColor ?? Colors.white,
                        fontweight: FontWeight.w500,
                        letterspace: letterspace,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadingDiag() {
    return PopScope(
      canPop: false,
      child: Container(
        color: Colors.black.withOpacity(.7),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 130),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: SizedBox(
            height: Sizes.h150,
            width: Sizes.h150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpinKitFadingCube(
                  color: Colors.white,
                  size: 30,
                ),
                customDivider(height: Sizes.h25),
                Text(
                  'please wait ...',
                  style: MyDecor()
                      .textstyle(fontcolor: Colors.white, fontsize: Sizes.w15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  futureLoading({double? iconSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCube(
          color: Colors.grey,
          size: iconSize ?? 30,
        ),
        customDivider(height: Sizes.h25),
        Text(
          'please wait ...',
          style:
              MyDecor().textstyle(fontcolor: Colors.black, fontsize: Sizes.w15),
        )
      ],
    );
  }

  snackalert(BuildContext context, String message, {Color? snackColor}) {
    Flushbar(
      message: message,
      backgroundColor: snackColor ?? Colors.red,
      duration: const Duration(seconds: 5),
      padding: const EdgeInsets.all(10),
    ).show(context);
  }

  customDivider({double? height, Color? color, double? thickness}) {
    return SizedBox(
      height: height ?? 1,
    );
  }

  customhorizontal({double? width}) {
    return SizedBox(
      width: width ?? 1,
    );
  }
}

proceed() {}
