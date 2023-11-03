import 'package:flutter/material.dart';

//App Colors
class AppColor {
  const AppColor._();

  static const themeColor = Color.fromRGBO(19, 2, 168, 1);
  static const bgColor = Color.fromARGB(255, 255, 255, 255);
  static const loginBgColor = Color.fromRGBO(11, 51, 136, 1);
  static const inputbgclr = Color.fromARGB(255, 255, 255, 255);
  static const highlightclr = Color.fromRGBO(251, 189, 1, 1);
  static const nonEditable = Color(0xffe5e5e5);

  //textfield
  static const widget = Color(0xff999999);
  static const red = Colors.red;
  static const primary = Color.fromARGB(255, 255, 255, 255);
  static const iconColorB = Color.fromARGB(255, 255, 255, 255);
  static const iconColor = Colors.black;
  static const titleTextColor = Colors.black;
  static const submit = Colors.blue;

  static const cancel = Colors.grey;
}

//get Order Status color by Status Name
getOrderStatusClr(var value) {
  dynamic result;
  var sts = value.toString().toLowerCase();

  if (sts.isNotEmpty) {
    if (sts == "rejected") {
      result = const Color.fromARGB(255, 227, 50, 41);
    } else if (sts == "boq update pending") {
      result = const Color.fromARGB(255, 255, 149, 0);
    } else if (sts == "issue pending") {
      result = const Color.fromARGB(255, 32, 123, 214);
    } else if (sts == "issued") {
      result = const Color.fromARGB(255, 163, 205, 57);
    } else if (sts == "received") {
      result = const Color.fromARGB(255, 69, 146, 87);
    } else {
      result = const Color.fromARGB(255, 146, 13, 255);
    }
  } else {
    result = const Color.fromARGB(255, 146, 13, 255);
  }

  return result;
}

//get Return Order Status color by Status Name
getReturnStatusClr(var value) {
  var sts = value.toString().toLowerCase();

  dynamic result;

  if (sts == "return approved") {
    result = const Color.fromARGB(255, 37, 240, 255);
  } else if (sts == "return initiated") {
    result = const Color.fromARGB(255, 146, 13, 255);
  } else if (sts == "on site") {
    result = const Color.fromARGB(255, 243, 161, 46);
  } else if (sts == "return to store") {
    result = const Color.fromARGB(255, 160, 209, 36);
  } else if (sts == "partially returned") {
    result = const Color.fromARGB(255, 32, 123, 214);
  } else if (sts == "fully returned") {
    result = const Color.fromARGB(255, 69, 146, 87);
  } else {
    result = const Color.fromARGB(255, 146, 13, 255);
  }

  return result;
}

var boxDecorationData = BoxDecoration(
  borderRadius: BorderRadius.circular(6.0),
  color: AppColor.inputbgclr,
  // border: Border.all(width: 1, color: AppColor.themeColor),
  boxShadow: const [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 2,
    ),
  ],
);
