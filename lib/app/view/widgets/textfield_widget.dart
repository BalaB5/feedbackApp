import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/colors.dart';



// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onchanged;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;
  TextFieldWidget(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.onchanged,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      width: 1,
      color: AppColor.primary,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(15.0), color: AppColor.primary)
,
      child: TextFormField(
        onChanged: onchanged,
        // style: normalText2,
        controller: controller,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: border,
            enabledBorder: border,
            // errorStyle: const TextStyle(fontSize: 0.01),
                filled: true, //<-- SEE HERE
    fillColor: AppColor.primary,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            // keyboardType: TextInputType.multiline,
            //     minLines: 1, // <-- SEE HERE
            //     maxLines: 5,
            hintText: hintText),
        keyboardType: keyboardType,
      ),
    );
  }
}

//more text
// ignore: must_be_immutable
class TextFieldWidget2 extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onchanged;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;

  TextFieldWidget2(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.onchanged,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      width: 1,
      color: AppColor.primary,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(15.0), color: AppColor.primary),
      child: TextFormField(
        onChanged: onchanged,
        controller: controller,
        initialValue: initialValue,
        validator: validator,

        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: border,
            enabledBorder: border,
            // errorStyle: const TextStyle(fontSize: 0.01),
                filled: true, //<-- SEE HERE
    fillColor: AppColor.primary,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: InputBorder.none,
            iconColor: AppColor.iconColorB,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText),

        keyboardType: TextInputType.multiline,
        minLines: 1, // <-- SEE HERE
        maxLines: 5,
      ),
    );
  }
}

//more text
// ignore: must_be_immutable
class TextFieldWidget3 extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onchanged;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;
  int? char;

  TextFieldWidget3(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.onchanged,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.char,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      width: 1,
      color: AppColor.primary,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(15.0), color: AppColor.primary)
,
      child: TextFormField(
        onChanged: onchanged,
        controller: controller,
        initialValue: initialValue,
        validator: validator,

        obscureText: obscureText,

        decoration: InputDecoration(
            focusedBorder: border,
                filled: true, //<-- SEE HERE
    fillColor: AppColor.primary,
            // errorStyle: const TextStyle(fontSize: 0.01),
            enabledBorder: border,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            iconColor: AppColor.iconColorB,
            suffixIcon: suffixIcon,
            hintText: hintText),
        keyboardType: TextInputType.number,
        // keyboardType: TextInputType.multiline,
        //        maxLength: 3,// <-- SEE HERE
        inputFormatters: [
          LengthLimitingTextInputFormatter(char),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

// For medical description
class TextFieldWidget4 extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onchanged;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;

  TextFieldWidget4(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.onchanged,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      width: 1,
      color: AppColor.widget,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = const OutlineInputBorder(
    // borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,

      child: TextFormField(
        onChanged: onchanged,
        controller: controller,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          
            focusedBorder: border,
              enabledBorder: border,
            errorStyle: const TextStyle(fontSize: 0.01),
                filled: true, //<-- SEE HERE
    fillColor: AppColor.widget,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                // const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                const EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText),
        maxLines: 20,
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginTextField extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onchanged;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;
  LoginTextField(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.onchanged,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      width: 1,
      color: AppColor.primary,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0x8fffffff),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 3.0,
                color: AppColor.primary,
                offset: const Offset(2, 0)),
          ]),
      child: TextFormField(
        onChanged: onchanged,
        controller: controller,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: border,
            errorStyle: const TextStyle(fontSize: 0.01),
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            // keyboardType: TextInputType.multiline,
            //     minLines: 1, // <-- SEE HERE
            //     maxLines: 5,
            hintText: hintText),
        keyboardType: keyboardType,
      ),
    );
  }
}

class TextFieldWidget5 extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  String? initialValue;
  String? Function(String?)? onChanged;
  int? minLines;
  int? maxLines;
  int? char;
  dynamic icon;
  TextFieldWidget5(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.initialValue,
      this.onChanged,
      this.minLines,
      this.maxLines,
      this.char,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      margin: const EdgeInsets.symmetric(horizontal: 2, ),
      decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(15.0), color: AppColor.primary)
,
      child: TextFormField(
        cursorHeight: 15,
        // cursorColor: AppColor.text2,
        onChanged: onChanged,
        initialValue: initialValue,
        enabled: true,

        style: TextStyle(
            // height:
            //     MediaQuery.of(context).size.height * 0.0025,
            color: AppColor.titleTextColor),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(
              0,
              0,
              5,
              0,
            ),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: Icon(
              icon,
              color: AppColor.iconColor,
              size: 15,
            ),
            prefixIconConstraints: BoxConstraints(
        minWidth: 35,
        minHeight: 20,
      ),
            // border: InputBorder.none,
            // suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
                          textAlign: TextAlign.center,

        keyboardType: TextInputType.number,
        // keyboardType: TextInputType.multiline,
        //        maxLength: 3,// <-- SEE HERE
        inputFormatters: [
          LengthLimitingTextInputFormatter(char),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
