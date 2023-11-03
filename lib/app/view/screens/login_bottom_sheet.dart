import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../controller/controller.dart';
import '../../controller/local_encryption_methods.dart';
import '../../core/colors.dart';
import '../../core/data.dart';
import 'homepage.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final Controller c = Get.put(Controller());

  //Local data Storage Encryption Method connect
  var instance = LocalStorageEncryptionMethod.instance;

  //Local database have userID and password(true) or not(false)
  bool nomember = false;

  final keyvalue = GlobalKey();

  bool _isVisible = false;

  final _userid = TextEditingController();

  final _password = TextEditingController();

  late double value = keyvalue.currentContext!.size!.height;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  late Box box1;

  @override
  void initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() {
    if (box1.get('username') != null) {
      setState(() {
        _userid.text = instance.decrypt(box1.get('username'));
        nomember = true;
      });
    }
    if (box1.get('pass') != null) {
      setState(() {
        _password.text = instance.decrypt(box1.get('pass'));
        nomember = true;
      });
    }
  }

  void login() {
    if (nomember) {
      box1.put('username', instance.encrypt(_userid.value.text));
      box1.put('pass', instance.encrypt(_password.value.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    double scrnwidth = MediaQuery.of(context).size.width;
    double scrnhight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: scrnhight * 0.45,
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          bottom: 20,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Login into your Account",
              style: TextStyle(color: AppColor.themeColor),
              textAlign: TextAlign.start,
            ),
            Container(
              width: scrnwidth * 0.9,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 115, 114, 114),
              ),
              child: Row(
                children: <Widget>[
                  // Flexible(
                  //   fit: FlexFit.tight,
                  //   flex: 1,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: const Icon(
                  //       Icons.person,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        //userid
                        controller: _userid,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 115, 114, 114),
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "User ID",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 115, 114, 114),
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        // onChanged: _onchangedid,
                        // onSubmitted: print(_value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: scrnwidth * 0.9,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 115, 114, 114),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: InkWell(
                      onTap: () => updateStatus(),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        //userid
                        controller: _password,
                        obscureText: _isVisible ? false : true,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 115, 114, 114),
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 115, 114, 114),
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        // onChanged: _onchangedid,
                        // onSubmitted: print(_value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Checkbox(
                    value: nomember,
                    checkColor: Color.fromARGB(255, 115, 114, 114),
                    activeColor: Colors.green,
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        width: 2.0,
                        color: AppColor.themeColor,
                      ),
                    ),
                    onChanged: (boolvalue) {
                      setState(() {
                        nomember = !nomember;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Remember Me',
                      style: TextStyle(
                        color: AppColor.themeColor,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: AppColor.themeColor),
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AppHomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColor.themeColor),
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppColor.themeColor,
                ),
                width: scrnwidth * 0.4,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  TextData.login,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
