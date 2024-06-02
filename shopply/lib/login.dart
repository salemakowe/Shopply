import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/myassets.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/constants/mywidgets.dart';
import 'package:shopply/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordvisible = true;
  IconData visibilityIcon = Icons.visibility;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Sizes.h40,
                      ),
                      Image.asset(
                        MyAssets.logoBlue,
                        width: Sizes.w70,
                      ),
                      customDivider(height: Sizes.h20),
                      Text(
                        "Welcome to Shopply",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.w25,
                        ),
                      ),
                      customDivider(height: Sizes.h10),
                      Text(
                        "Sign in to continue",
                        style: GoogleFonts.poppins(
                          fontSize: Sizes.w15,
                          color: Colors.grey,
                        ),
                      ),
                      customDivider(height: Sizes.h40),

                      //Email
                      TextFormField(
                        controller: emailController,
                        decoration: MyDecor().form(
                          context: context,
                          hinttext: "Your Email / Username",
                          prefixicon: const Icon(
                            Icons.mail_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      customDivider(height: Sizes.h10),

                      //Password
                      TextFormField(
                        controller: passwordController,
                        obscureText: _passwordvisible,
                        decoration: MyDecor().form(
                          context: context,
                          hinttext: "Password",
                          prefixicon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          suffixicon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordvisible = !_passwordvisible;
                              });
                            },
                            child: Icon(
                              _passwordvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      customDivider(height: Sizes.h20),

                      //Button
                      MyWidget().button(
                        context: context,
                        proceed: proceed,
                        buttonText: "Sign in",
                      ),

                      customDivider(height: Sizes.h15),

                      //OR and Social Media

                      //Google Sign in
                      MyWidget().button(
                        context: context,
                        proceed: () {
                          print(" Google sign in");
                        },
                        icon: Image.asset(
                          MyAssets.googleLogo,
                          width: Sizes.w20,
                          height: Sizes.h20,
                        ),
                        buttonText: "Sign in with Google",
                        buttonTextColor: Colors.grey,
                        buttonColor: Colors.white,
                      ),

                      customDivider(height: Sizes.h15),

                      //Apple Sign in
                      MyWidget().button(
                        context: context,
                        proceed: () {
                          print(" Apple sign in");
                        },
                        icon: Image.asset(
                          MyAssets.appleLogo,
                          width: Sizes.w25,
                          height: Sizes.h25,
                        ),
                        buttonText: "Sign in with Apple",
                        buttonTextColor: Colors.grey,
                        buttonColor: Colors.white,
                      ),

                      customDivider(height: Sizes.h15),

                      //Facebook Sign in
                      MyWidget().button(
                        context: context,
                        proceed: () {
                          print(" Facebook sign in");
                        },
                        icon: Image.asset(
                          alignment: Alignment.centerLeft,
                          MyAssets.facebookLogo,
                          width: Sizes.w25,
                          height: Sizes.h25,
                        ),
                        buttonText: "Sign in with Facebook",
                        buttonTextColor: Colors.grey,
                        buttonColor: Colors.white,
                      ),

                      customDivider(height: Sizes.h30),
                      //Forgot Password
                      GestureDetector(
                        onTap: () {
                          print("Forgot password");
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: MyColors.mainColor,
                            letterSpacing: Sizes.w2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      customDivider(height: Sizes.h20),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: MyDecor().textstyle(
                            fontcolor: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("registered");
                                },
                              text: ' Register',
                              style: MyDecor().textstyle(
                                fontcolor: MyColors.mainColor,
                              ),
                            )
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

  proceed() {}
}
