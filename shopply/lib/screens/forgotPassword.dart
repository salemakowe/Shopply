import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/constants/mywidgets.dart';
import 'package:shopply/main.dart';
import 'package:shopply/screens/otppage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool isReadonly = true;

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: PopScope(
        canPop: true,
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
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
                textScaler: TextScaler.linear(textScale),
              ),
              child: Padding(
                padding: internalPadding(context),

                //start your widget from here
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyWidget().customDivider(height: Sizes.h30),
                      Text(
                        'Confirm your email',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.w25,
                        ),
                      ),
                      MyWidget().customDivider(height: Sizes.h5),
                      Text(
                        'Kindly confirm your email by clicking the Continue or Edit button.',
                        style: GoogleFonts.poppins(
                          fontSize: Sizes.w13,
                        ),
                      ),
                      MyWidget().customDivider(height: Sizes.h20),
                      TextFormField(
                        controller: emailController,
                        readOnly: isReadonly,
                        decoration: MyDecor().form(
                          context: context,
                          hinttext: "your email",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: Sizes.w13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      MyWidget().customDivider(height: Sizes.h50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyWidget().button(
                                  context: context,
                                  boxHeight: Sizes.h40,
                                  boxWidth: Sizes.w150,
                                  buttonText: 'Edit',
                                  buttonTextSize: Sizes.w18,
                                  buttonColor: Colors.amber.withOpacity(.7),
                                  proceed: () {
                                    setState(() {
                                      isReadonly = false;
                                    });
                                  }),
                            ),
                            SizedBox(
                                width: Sizes
                                    .w10), // Adjust spacing between buttons
                            Expanded(
                              child: MyWidget().button(
                                context: context,
                                boxHeight: Sizes.h40,
                                boxWidth: Sizes.w150,
                                buttonText: 'Continue',
                                buttonTextSize: Sizes.w18,
                                proceed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpPage(
                                        email: emailController.text,
                                      ),
                                    ),
                                  );
                                }, // Example for another button
                              ),
                            ),
                          ],
                        ),
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
