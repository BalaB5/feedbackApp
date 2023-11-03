import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../core/icons.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Controller c = Get.put(Controller());

    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          Get.toEnd<Controller>;
          // var i = c;
          // var y = 8;
        },
        child: const Icon(
          AppIconData.logout,
          size: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
