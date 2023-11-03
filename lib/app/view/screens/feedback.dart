import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../core/colors.dart';
import '../widgets/textfield_widget.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// import 'package:xi_performer/app/core/app_colors.dart';

class CreateProfilefeed extends StatefulWidget {
  const CreateProfilefeed({super.key});

  @override
  State<CreateProfilefeed> createState() => _CreateProfilefeedState();
}

class _CreateProfilefeedState extends State<CreateProfilefeed> {
  dynamic userData;
  bool oneTimeDataLoaded = false;
  final _formKey = GlobalKey<FormState>();

  //user datas
  dynamic name;
  dynamic lastname;
  dynamic _genderValue;
  dynamic dob;
  dynamic address;
  // dynamic address2;
  dynamic city;
  dynamic pinCode;
  dynamic email;
  dynamic number;
  dynamic gender;
  dynamic height;
  dynamic weight;
  dynamic ageCategory;
  dynamic ConvertImage;

  var detaillist1 = [];

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppColor.red,
      width: 1,
      style: BorderStyle.solid,
    ),
  );
  // final Controller c = Get.put(Controller());

  String _verticalGroupValue = "Pending";

  final _status = ["Male", "Female", "Transgender"];

  @override
  Widget build(BuildContext context) {
    // Posting the personal details
    accept() {
      if (name != null &&
          lastname != null &&
          pinCode != null &&
          city != null &&
          address != null &&
          height != null &&
          weight != null &&
          number != null &&
          email != null &&
          _genderValue != null &&
          dob != null) {
        detaillist1.add(name); //0
        detaillist1.add(_genderValue); //1
        detaillist1.add(dob); //2
        detaillist1.add(double.parse(height.toString()).toDouble()); //3
        detaillist1.add(double.parse(weight.toString()).toDouble()); //4
        detaillist1.add(int.parse(number.toString()).toInt()); //5
        detaillist1.add(email); //6
        detaillist1.add(address); //7
        detaillist1.add(city); //8
        detaillist1.add(pinCode); //9
        detaillist1.add(lastname); //10
        // detaillist1.add(address2);
        detaillist1.add(ageCategory); //11
        detaillist1.add(ConvertImage); //12
        // putPersonalDetails(context, profileData);
        // postPersonalDetails(context, detaillist1, email);
        // putPersonalDetails(context, profileData, detaillist1);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
        backgroundColor: AppColor.themeColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Fill your personal details',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Divider(),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    //name
                    TextFieldWidget(
                      // initialValue: name,
                      hintText: 'Enter your full name',

                      onchanged: (newName) {
                        name = newName ?? "Enter your full name";
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),
                    //Customer
                    TextFieldWidget(
                      // initialValue: name,
                      hintText: 'Enter your Customer ID',

                      onchanged: (newName) {
                        name = newName ?? "Enter your Customer ID";
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Enter your Customer ID';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),
                    // Mobile Number
                    TextFieldWidget3(
                      hintText: 'Enter your Mobile number',

                      keyboardType: TextInputType.phone,
                      //controller: _phonenumController,

                      onchanged: (numberText) {
                        number = numberText ?? "Enter your Mobile number";
                        return null;
                      },
                      char: 10,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Enter your Mobile number"),
                        PatternValidator(r'^(?:[+0][1-9])?[0-9]{10}$',
                            errorText: ''),
                      ]),
                    ),

                    const SizedBox(height: 16.0),

                    // E-Mail
                    TextFieldWidget(
                      onchanged: (text) {
                        // profileData = profileData.copyWith(email: text);
                        email = text ?? " Enter your Email address";
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Enter your Email address';
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return ' Enter a valid email address';
                        }
                        return null;
                      },
                      hintText: 'E-mail',
                    ),
                    const SizedBox(height: 16.0),
                    //age
                    TextFieldWidget(
                      // initialValue: name,
                      hintText: 'Enter your Age',

                      onchanged: (newName) {
                        name = newName ?? "Enter your Age";
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Enter your Age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Gender',
                      style: TextStyle(
                        color: AppColor.themeColor,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 50.0,
                      child: RadioGroup<String>.builder(
                        direction: Axis.horizontal,
                        groupValue: _verticalGroupValue,
                        horizontalAlignment: MainAxisAlignment.spaceAround,
                        onChanged: (value) => setState(() {
                          _verticalGroupValue = value ?? '';
                        }),
                        items: _status,
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: AppColor.themeColor,
                        ),
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                        ),
                      ),
                    ),

                    //text
                    const Text(
                      'Do you have any suggestions or Comments?',
                      style: TextStyle(
                        color: AppColor.themeColor,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    //name
                    TextFieldWidget4(
                      // prefixIcon: const Icon(
                      //   AppIconData.description,
                      // ),

                      hintText: 'Share your suggestions',
                      onchanged: (text) {
                        // health = text;
                        return null;
                      },
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Share your suggestions"),
                      ]),
                    ),
                    const SizedBox(height: 16.0),
                    //button
                    Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.cancel,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: (() {}),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      // const SizedBox(width: 13),
                                      // const Icon(CupertinoIcons.arrow_right),
                                    ],
                                  )),
                            )),
                        const SizedBox(width: 16.0),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.themeColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: (() {}),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      // const SizedBox(width: 13),
                                      // const Icon(CupertinoIcons.arrow_right),
                                    ],
                                  )),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
