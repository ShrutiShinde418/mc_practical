import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget childWidget;
  final Function onPressed;
  const CalcButton(
      {Key key, this.backgroundColor, this.childWidget, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(
        child: childWidget,
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
