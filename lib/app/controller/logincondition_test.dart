import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../view/widgets/pop_box.dart';
import 'controller.dart';
import 'encryption_methods.dart';

Future loginValitation(String username, String password, context) async {
  final Controller c = Get.put(Controller());
  try {
    if (username == "" || password == "") {
      popBox(context, "Please Enter Valid\nLogin ID and Password");
    } else {
      // var de = EncryptionMethods.instance.decrypt("qpvgRxgH0JnCswGR6uwgvw==");
      var encrypted = EncryptionMethods.instance.encrypt(password);
      var loginUri = Uri.parse("${c.baseurlforlogin.value}/authenticate");
      var dataAuth = await http.post(
        loginUri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode(
          <String, String>{"userName": username, "password": encrypted},
        ),
      );

      if (dataAuth.statusCode == 200) {
        c.apiToken.value = dataAuth.body;
        final Uri uri = Uri.parse(
          "${c.baseurl.value}log/$username/$encrypted",
        );
        final response = await http.get(
          uri,
          headers: <String, String>{
            'Accept': 'application/json',
            'Authorization': 'Bearer ${c.apiToken.value}',
          },
        );
        if (response.statusCode == 200) {
          var datareceived = jsonDecode(response.body);
          var projectMappingResponse = await Dio().get(
            '${c.baseurl.value}projectMapping/userId/${datareceived["userId"]}',
            options: Options(
              headers: {"Authorization": "Bearer ${c.apiToken.value}"},
            ),
          );

          dynamic projectMappingData = projectMappingResponse.data;
          c.projectId.value = projectMappingData[0]['projectId'];
          c.updateUser(datareceived);
          c.onInit();

          if (datareceived['roleId'] == 7 ||
              datareceived['roleId'] == 3 ||
              datareceived['roleId'] == 2) {
            if (datareceived["authType"].toString() == 'EmailAuthentication') {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const OtpScreen()),);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
            }
          } else {
            popBox(context, "Please Enter Correct PSID and Password");
          }
        } else {
          popBox(context, "Please Enter Correct PSID and Password");
        }
      } else {
        popBox(context, "Please Enter Correct PSID and Password");
      }
    }
  } catch (e) {
    popBox(context, "Check your\ninternet connection");
  }
}
