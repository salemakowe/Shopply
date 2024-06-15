import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/myassets.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/constants/mywidgets.dart';
import 'package:shopply/screens/login.dart';
import 'package:shopply/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isPwdVisible = true;
  bool _isConfirmPwdVisible = true;

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
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
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  )),
            ),
            body: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
                textScaler: TextScaler.linear(textScale),
              ),
              child: Padding(
                padding: internalPadding(context),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Sizes.h40,
                          ),
                          Image.asset(MyAssets.logoBlue, width: Sizes.w70),
                          MyWidget().customDivider(height: Sizes.h20),
                          Text(
                            "Let's get Started",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w25,
                            ),
                          ),
                          MyWidget().customDivider(height: Sizes.h10),
                          Text(
                            "Create a new account",
                            style: GoogleFonts.poppins(
                              fontSize: Sizes.w18,
                              color: Colors.grey,
                            ),
                          ),
                          MyWidget().customDivider(height: Sizes.h40),
                          firstName(context),
                          MyWidget().customDivider(height: Sizes.h10),
                          lastName(context),
                          MyWidget().customDivider(height: Sizes.h10),
                          email(context),
                          MyWidget().customDivider(height: Sizes.h10),
                          pwd(context),
                          MyWidget().customDivider(height: Sizes.h10),
                          confirmPwd(context),
                          MyWidget().customDivider(height: Sizes.h10),
                          MyWidget().button(
                            context: context,
                            proceed: () {},
                            buttonText: "Sign Up",
                          ),
                          MyWidget().customDivider(height: Sizes.h10),
                          RichText(
                            text: TextSpan(
                                text: 'have and account? ',
                                style: MyDecor().textstyle(
                                  fontcolor: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ),
                                        );
                                      },
                                    text: "Login",
                                    style: MyDecor().textstyle(
                                      fontcolor: MyColors.mainColor,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  firstName(BuildContext context) {
    return TextFormField(
      controller: fNameController,
      decoration: MyDecor().form(
        context: context,
        hinttext: "First Name",
        prefixicon: const Icon(
          Icons.person_outline,
          color: Colors.grey,
        ),
      ),
    );
  }

  lastName(BuildContext context) {
    return TextFormField(
      controller: lNameController,
      decoration: MyDecor().form(
        context: context,
        hinttext: "Last Name",
        prefixicon: const Icon(
          Icons.person_outline,
          color: Colors.grey,
        ),
      ),
    );
  }

  email(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: MyDecor().form(
        context: context,
        hinttext: "Email",
        prefixicon: const Icon(
          Icons.mail_outline,
          color: Colors.grey,
        ),
      ),
    );
  }

  pwd(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: _isPwdVisible,
      decoration: MyDecor().form(
        context: context,
        hinttext: "Enter your password",
        prefixicon: const Icon(Icons.lock_outline, color: Colors.grey),
        suffixicon: GestureDetector(
          onTap: () {
            setState(() {
              _isPwdVisible = !_isPwdVisible;
            });
          },
          child: Icon(
            _isPwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  confirmPwd(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: _isConfirmPwdVisible,
      decoration: MyDecor().form(
        context: context,
        hinttext: "Confirm you password",
        prefixicon: const Icon(Icons.lock_outline, color: Colors.grey),
        suffixicon: GestureDetector(
          onTap: () {
            setState(() {
              _isConfirmPwdVisible = !_isConfirmPwdVisible;
            });
          },
          child: Icon(
            _isConfirmPwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
