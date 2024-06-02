import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/myassets.dart';
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
  bool passwordvisible = true;
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
                        fontSize: Sizes.w20,
                      ),
                    ),
                    customDivider(height: Sizes.h10),
                    Text(
                      "Sign in to continue",
                      style: GoogleFonts.poppins(
                        fontSize: Sizes.w12,
                        color: Colors.grey,
                      ),
                    ),
                    customDivider(height: Sizes.h40),

                    //Email
                    TextFormField(
                      controller: emailController,
                      decoration: MyDecor().form(
                        context: context,
                        hinttext: "Your Email",
                        prefixicon: const Icon(
                          Icons.mail_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    customDivider(height: Sizes.h10),

                    //Password
                    TextFormField(
                      controller: emailController,
                      decoration: MyDecor().form(
                        context: context,
                        hinttext: "Password",
                        prefixicon: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
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
                      proceed: proceed,
                      icon: Icon(Icons.mail),
                      buttonText: "Login with Google",
                      buttonTextColor: Colors.grey,
                      buttonColor: Colors.white,
                    ),

                    customDivider(height: Sizes.h15),

                    //Apple Sign in
                    MyWidget().button(
                      context: context,
                      proceed: proceed,
                      buttonText: "Login with Apple",
                      buttonTextColor: Colors.grey,
                      buttonColor: Colors.white,
                    ),
                  ],
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
