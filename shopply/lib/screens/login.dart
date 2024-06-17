import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopply/constants/myassets.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/constants/mywidgets.dart';
import 'package:shopply/main.dart';
import 'package:shopply/screens/dashboard.dart';
import 'package:shopply/screens/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  IconData visibilityIcon = Icons.visibility;
  bool _passwordVisible = true;
  bool hasError = true;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    // final height = Sizes().heightSizeCalc(context);
    // final width = Sizes().widthSizeCalc(context);

    return SafeArea(
      child: PopScope(
        canPop: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: Sizes.h40),
                        Image.asset(MyAssets.logoBlue, width: Sizes.w70),
                        MyWidget().customDivider(height: Sizes.h20),
                        Text(
                          "Welcome to Shopply",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w25,
                          ),
                        ),
                        MyWidget().customDivider(height: Sizes.h10),
                        Text(
                          "Sign in to continue",
                          style: GoogleFonts.poppins(
                            fontSize: Sizes.w18,
                            color: Colors.grey,
                          ),
                        ),
                        MyWidget().customDivider(height: Sizes.h40),

                        // Email
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: MyDecor().form(
                            context: context,
                            hinttext: "Your Email / Username",
                            prefixicon: const Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                          ),
                          onEditingComplete: node.nextFocus,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              setState(() {
                                hasError = true;
                              });
                              return 'Email cannot be empty';
                            } else if (!value.contains('@') ||
                                !value.contains('.com')) {
                              setState(() {
                                hasError = true;
                              });
                              return 'Invalid email address';
                            } else {
                              setState(() {
                                hasError = false;
                              });
                              return null;
                            }
                          },
                        ),
                        MyWidget().customDivider(height: Sizes.h10),

                        // Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: _passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
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
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          onEditingComplete: node.nextFocus,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password can be empty';
                            }
                            return null;
                          },
                        ),
                        MyWidget().customDivider(height: Sizes.h20),

                        // Button
                        MyWidget().button(
                          context: context,
                          proceed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              userSignIn();
                            }
                          },
                          buttonText: "Sign in",
                        ),

                        MyWidget().customDivider(height: Sizes.h15),

                        // OR and Social Media
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2,
                                indent: 20,
                                endIndent: 10,
                              ),
                            ),
                            Text("OR"),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2,
                                indent: 10,
                                endIndent: 20,
                              ),
                            ),
                          ],
                        ),

                        MyWidget().customDivider(height: Sizes.h15),

                        // Google Sign in
                        MyWidget().button(
                          context: context,
                          proceed: () {
                            print("Google sign in");
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

                        MyWidget().customDivider(height: Sizes.h15),

                        // Apple Sign in
                        MyWidget().button(
                          context: context,
                          proceed: () {
                            print("Apple sign in");
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

                        MyWidget().customDivider(height: Sizes.h15),

                        // Facebook Sign in
                        MyWidget().button(
                          context: context,
                          proceed: () {
                            print("Facebook sign in");
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

                        MyWidget().customDivider(height: Sizes.h30),

                        // Forgot Password
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
                        MyWidget().customDivider(height: Sizes.h20),
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage(),
                                      ),
                                    );
                                  },
                                text: ' Register',
                                style: MyDecor().textstyle(
                                  fontcolor: MyColors.mainColor,
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
      ),
    );
  }

  userSignIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: MyColors.mainColor,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/dashboard');
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        errorMessage = 'Invalid Email or Password';
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            contentPadding: const EdgeInsets.all(16.0),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    } finally {
      if (mounted) {
        Navigator.pop(context); // Close the progress indicator dialog
      }
    }
  }
}
