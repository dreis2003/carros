import 'package:flutter/material.dart';

Future push(context, Widget page, {bool replace = false}) {
  if (replace) {
    print(replace);
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
