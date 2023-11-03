import 'package:feedback_app/app/core/colors.dart';
import 'package:flutter/material.dart';
import '../../core/data.dart';
import 'feedback.dart';
import 'login_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // double scrnwidth = MediaQuery.of(context).size.width;
    // double scrnhight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: Text(
              TextData.appNmae,
              style: TextStyle(
                  color: AppColor.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: ElevatedButton(
                child: const Text('Customer Logoin'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateProfilefeed()));
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: TextButton(
                child: const Text('Agency Logoin'),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25),
                          topStart: Radius.circular(25),
                        ),
                      ),
                      builder: (context) {
                        return const LoginBottomSheet();
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
