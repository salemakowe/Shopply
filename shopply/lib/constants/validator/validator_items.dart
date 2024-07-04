import 'package:flutter/material.dart';
import 'package:shopply/constants/mydecoration.dart';

@immutable
class ValidatorItemWidget extends StatelessWidget {
  final String text;
  final int conditionValue;
  final Color color;
  final bool value;

  const ValidatorItemWidget(
      this.text, this.conditionValue, this.color, this.value,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            child: value
                ? Icon(
                    Icons.check_circle_outline,
                    color: color,
                    size: 15,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: color,
                    size: 15,
                  ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              text,
              style: MyDecor().textstyle(fontcolor: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
