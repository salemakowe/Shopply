import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/constants/mywidgets.dart';
import 'package:shopply/main.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: PopScope(
        canPop: true,
        child: Scaffold(
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              padding: const EdgeInsets.all(0),
              textScaler: TextScaler.linear(textScale),
            ),
            child: Padding(
              padding: internalPadding(context),

              //start your widget from here
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Please enter the OTP code sent to ${widget.email}',
                      style: GoogleFonts.poppins(),
                    ),
                    MyWidget().customDivider(height: Sizes.h20),
                    Expanded(
                      // child:
                      //     NotificationListener<OverscrollIndicatorNotification>(
                      //   onNotification: (overscroll) {
                      //     overscroll.disallowIndicator();
                      //     return true;
                      //   },
                      //still giving error
                      child: OtpTextField(
                        numberOfFields: 4,
                      ),
                    ),
                    //),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List _inputCodes = <int>[];
late Timer customTimer;

class CodePanel extends StatelessWidget {
  final int? codeLength;
  final int? currentLength;
  const CodePanel({
    super.key,
    this.codeLength,
    this.currentLength,
  });

  @override
  Widget build(BuildContext context) {
    var circles = <Widget>[];
    Color containerColor = MyColors.lightgrey;
    for (int i = 1; i <= codeLength!; i++) {
      if (i > currentLength!) {
        circles.add(
          SizedBox(
            height: Sizes.w50,
            width: Sizes.w50,
            child: Container(
              decoration: MyDecor().container(
                  context: context,
                  containerColor: Colors.white,
                  curve: Sizes.w15,
                  borderColor: containerColor),
            ),
          ),
        );
      } else {
        // print(i);
        // print(_inputCodes);
        // print(_inputCodes.last);
        circles.add(
          SizedBox(
            height: Sizes.w50,
            width: Sizes.w50,
            child: Container(
              alignment: Alignment.center,
              decoration: MyDecor().container(
                context: context,
                containerColor: containerColor,
                curve: Sizes.w15,
              ),
              child: Text(_inputCodes[i - 1].toString()),
            ),
          ),
        );
      }
    }
    return Padding(
      padding: EdgeInsets.only(left: Sizes.w35, right: Sizes.w35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: circles,
      ),
    );
  }
}

buildContainerCircle(int number) {
  return InkWell(
    child: Container(
      height: Sizes.w50,
      width: Sizes.w50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: Sizes.w25,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
