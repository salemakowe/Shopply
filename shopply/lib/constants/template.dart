import 'package:flutter/material.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';

class Template extends StatefulWidget {
  const Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
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
              // child: ,
            ),
          ),
        ),
      ),
    );
  }
}
