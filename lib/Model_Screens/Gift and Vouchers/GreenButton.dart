import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color Textcolor;
  final Color borderColor;
  const GreenButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.Textcolor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColor,
            border: Border.all(color: borderColor)),
        child: TextButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(color: Textcolor),
            )));
  }
}
