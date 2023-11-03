import 'package:flutter/material.dart';

popBox(BuildContext context, String name) {
  AlertDialog alert = AlertDialog(
    content: Text(
      name,
      textAlign: TextAlign.center,
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
