import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: PopScope(
        canPop: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus;
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Create Password',
                style: GoogleFonts.poppins(
                  fontSize: Sizes.w20,
                ),
              ),
            ),
            body: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
                textScaler: TextScaler.linear(textScale),
              ),
              child: Padding(
                padding: internalPadding(context),

                //start your widget from here
                // child: ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
