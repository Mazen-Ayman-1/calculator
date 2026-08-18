import 'package:calclutor/cores/colors_app.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  Color foregroundColor;
  int flex;
  Function() onPressed;
  NumberButton({
    super.key,
    required this.text,
    this.backgroundColor = ColorsApp.grey,
    this.foregroundColor = ColorsApp.white,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        child: Text(text),
      ),
    );
  }
}
