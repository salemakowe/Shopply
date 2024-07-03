import 'dart:async';

import 'package:another_telephony/telephony.dart';
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
  bool resendOTP = false;
  int customSecond = 00;
  int customMin = 1;
  late Timer customTimer;

  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    customCount();
  }

  @override
  void dispose() {
    customTimer.cancel();
    super.dispose();
  }

  String otpExtractor(String otpMessage) {
    return otpMessage.split(' ')[5].trim();
  }

  void customCount() {
    customTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (customSecond == 0) {
          if (customMin != 0) {
            if (mounted) {
              setState(() {
                customMin--;
                customSecond = 59;
              });
            }
          } else {
            customTimer.cancel();
            endTimer();
          }
        } else {
          if (mounted) {
            setState(() {
              customSecond--;
            });
          }
        }
      },
    );
  }

  void endTimer() {
    setState(
      () {
        resendOTP = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: PopScope(
        canPop: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                  fontSize: Sizes.w20,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            body: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
                textScaler: TextScaler.linear(textScale),
              ),
              child: Padding(
                padding: internalPadding(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Please enter the OTP code sent to ${widget.email}',
                        style: GoogleFonts.poppins(),
                      ),
                      MyWidget().customDivider(height: Sizes.h20),
                      OtpTextField(
                        numberOfFields: 5,
                        enabledBorderColor: MyColors.lightgrey,
                        focusedBorderColor: MyColors.mainColor,
                        showFieldAsBox: true,
                        fieldWidth: Sizes.w50,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      MyWidget().customDivider(height: Sizes.h20),
                      MyWidget().button(
                        context: context,
                        proceed: proceed,
                        buttonColor:
                            resendOTP ? MyColors.mainColor : Colors.grey[100],
                        buttonTextSize: Sizes.w15,
                        buttonTextColor: resendOTP ? Colors.black : Colors.grey,
                        buttonText:
                            "I didn't receive the code ($customMin:${customSecond < 10 ? '0' : ''}$customSecond)",
                      ),
                    ],
                  ),
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
