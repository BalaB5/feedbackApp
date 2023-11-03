// import 'package:construction/app/view/widgets/pop_box.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../view/screens/otp_screen.dart';
// import 'controller.dart';
// import 'encryption_methods.dart';

// final Controller c = Get.put(Controller());

// //login Password and username Valitation
// Future loginValitation(String username, String password, context) async {
//   try {
//     if (username != "" && password != "") {
//       var encrypted = EncryptionMethods.instance.encrypt(password);

//       final Uri uri = Uri.parse(
//         "${c.baseurl}log/$username/$encrypted",
//       );
//       final response = await http.get(
//         uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer ${c.apiToken.value}',
//         },
//       );
//       if (response.statusCode == 200) {
//         var datareceived = jsonDecode(response.body);
//         c.updateUser(datareceived);
//         c.onInit();

//         if (datareceived['roleId'] == 7 ||
//             datareceived['roleId'] == 3 ||
//             datareceived['roleId'] == 2) {
//           if (datareceived["authType"].toString() == 'EmailAuthentication') {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => const OtpScreen()));
//           } else {
//             Navigator.of(context)
//                 .pushNamedAndRemoveUntil('/home', (route) => false);
//           }
//         } else {
//           popBox(context, "Please Enter Correct PSID and Password");
//         }
//       } else {
//         popBox(context, "Please Enter Correct PSID and Password");
//       }
//     } else {
//       popBox(context, "Please Enter Correct PSID and Password");
//     }
//   } catch (e) {
//     popBox(context, "Check Your Internet Connection");
//   }
// }
