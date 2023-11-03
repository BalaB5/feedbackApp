import 'package:feedback_app/app/core/colors.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: AppColor.themeColor, fontWeight: FontWeight.bold),
    );
  }
}
