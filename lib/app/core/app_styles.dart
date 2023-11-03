import 'package:flutter/material.dart';

import 'colors.dart';

class StyleDatas {
  StyleDatas._();

//input container Decoration
  static Decoration inputBox = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: const Color.fromARGB(255, 255, 255, 255),
    border: Border.all(width: 1, color: AppColor.themeColor),
  );
}

//container Decoration
var boxDecorationdata = BoxDecoration(
  borderRadius: BorderRadius.circular(6.0),
  color: AppColor.inputbgclr,
  border: Border.all(width: 1, color: AppColor.themeColor),
);

var rmkBox = BoxDecoration(
  borderRadius: BorderRadius.circular(6.0),
  color: AppColor.inputbgclr,
  border: Border.all(width: 1, color: AppColor.themeColor),
  boxShadow: const [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 2,
    ),
  ],
);
