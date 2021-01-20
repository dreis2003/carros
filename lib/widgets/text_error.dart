import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextError extends StatelessWidget {
  final String msg;

  Function onPressed;

  TextError(this.msg, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: onPressed,
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
        ),
      ),
    ));
  }
}
