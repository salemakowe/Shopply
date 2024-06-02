import 'package:flutter/material.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mysizes.dart';

class MyDecor {
  textstyle({
    Color? fontcolor,
    double? fontsize,
    FontWeight? fontweight,
    double? letterspace,
    double? sentenceSpace,
  }) {
    return TextStyle(
      letterSpacing: letterspace ?? 0,
      height: sentenceSpace ?? 1,
      color: fontcolor,
      fontSize: fontsize,
      fontFamily: 'Poppins',
      fontWeight: fontweight,
    );
  }

  formtextstyle(
      {Color? fontcolor,
      double? fontsize,
      FontWeight? fontweight,
      double? letterspace,
      double? sentenceSpace}) {
    return TextStyle(
        letterSpacing: letterspace ?? 0,
        height: sentenceSpace ?? 1,
        color: fontcolor,
        fontSize: fontsize,
        fontFamily: 'Poppins',
        fontWeight: fontweight);
  }

  buttonDecor(
      {Color? buttoncolor,
      Color? bordercolor,
      Color? elevationColor,
      double? elevation,
      double? bordercurver,
      required BuildContext context}) {
    double size = MediaQuery.of(context).size.width;
    double w5 = size * .0118;
    return ElevatedButton.styleFrom(
      elevation: elevation,
      shadowColor: Colors.transparent,
      backgroundColor: buttoncolor,
      // side: BorderSide(
      //   color: bordercolor ?? MyColors.green,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(bordercurver ?? w5),
        ),
      ),
    );
  }

  container({
    Color? containerColor,
    double? curve,
    Color? borderColor,
    BoxFit? boxFit,
    String? backgroundimage,
    BorderRadius? borderRadius,
    @required BuildContext? context,
  }) {
    double size = MediaQuery.of(context!).size.width;
    double w5 = size * .0118;
    return BoxDecoration(
      border: Border.all(color: borderColor ?? Colors.transparent),
      color: containerColor ?? MyColors.lightgrey,
      image: backgroundimage != null
          ? DecorationImage(
              image: AssetImage(backgroundimage),
              fit: boxFit ?? BoxFit.cover,
            )
          : null,
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(curve ?? w5),
          ),
    );
  }

  form({
    required BuildContext context,
    Widget? prefixicon,
    String? prefixText,
    Widget? suffixicon,
    String? hinttext,
    String? labeltext,
    Color? fillColor,
    Color? borderColor,
    TextStyle? hintStyle,
    bool? usetoppadding,
    bool? disableBorder,
    bool useHint = false,
  }) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: prefixicon,
      ),
      prefixIconConstraints: const BoxConstraints(minHeight: 4, minWidth: 4),
      suffixIconConstraints: const BoxConstraints(minHeight: 4, minWidth: 4),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: suffixicon,
      ),
      suffixIconColor: MyColors.formborder,
      label: useHint ? Text(hinttext ?? '') : null,
      contentPadding: EdgeInsets.only(
        left: Sizes.h20,
        top: usetoppadding == true ? 10 : 0,
      ),
      hintText: hinttext,
      hintStyle: hintStyle ??
          MyDecor().textstyle(
            fontcolor: MyColors.formborder,
          ),
      fillColor: fillColor ?? Colors.transparent,
      filled: true,
      errorMaxLines: 3,
      enabledBorder: disableBorder == true
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey[300]!,
                width: 1,
              ),
            ),
      focusedBorder: disableBorder == true
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: MyColors.formborder,
                width: 1,
              ),
            ),
      errorBorder: disableBorder == true
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
      focusedErrorBorder: disableBorder == true
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.w10),
              borderSide: BorderSide(
                color: borderColor ?? MyColors.formborder,
                width: 1,
              ),
            ),
    );
  }
}

buttonDecor(
    {Color? buttoncolor,
    Color? bordercolor,
    Color? elevationColor,
    double? elevation,
    double? bordercurver,
    required BuildContext context}) {
  double size = MediaQuery.of(context).size.width;
  double w5 = size * .0118;
  return ElevatedButton.styleFrom(
    elevation: elevation,
    shadowColor: Colors.transparent,
    backgroundColor: buttoncolor,
    side: BorderSide(
      color: bordercolor ?? MyColors.mainColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(bordercurver ?? w5),
      ),
    ),
  );
}
