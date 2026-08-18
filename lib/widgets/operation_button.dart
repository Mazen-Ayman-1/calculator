import 'package:calclutor/cores/colors_app.dart';
import 'package:flutter/material.dart';

class OPerationButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  Color foregroundColor;
  int flex;
  Function() onPressed;
  OPerationButton({
    super.key,
    required this.text,
    this.backgroundColor = ColorsApp.blue,
    this.foregroundColor = ColorsApp.white,
    required this.onPressed,
    this.flex = 2,
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
            textStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )

        ),
        child:  Text(text),
      ),
    );
  }
}


