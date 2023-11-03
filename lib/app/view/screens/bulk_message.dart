import 'package:feedback_app/app/core/colors.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 167, 165, 165),
      appBar: AppBar(
        title: const Text(
          "Balaji Gas Agency",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.themeColor,
      ),
      body: SingleChildScrollView(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          drwlistcard(
            name: "",
            titlename: "Dashboard",
            icon: Icons.dashboard,
            onTap: () {},
          ),
          drwlistcard(
            name: "",
            titlename: "User Management",
            icon: Icons.person,
            onTap: () {},
          ),
          drwlistcard(
            name: "",
            titlename: "Quick WhatsApp",
            icon: Icons.chat,
            onTap: () {},
          ),
          drwlistcard(
            name: "",
            titlename: "Bulk WhatsApp",
            icon: Icons.chat,
            onTap: () {},
          ),
          drwlistcard(
            name: "",
            titlename: " WhatsApp Report",
            icon: Icons.chat,
            onTap: () {},
          ),
          drwlistcard(
            name: "",
            titlename: "Change Password",
            icon: Icons.location_off,
            onTap: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Logout",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20, color: AppColor.themeColor),
            ),
          )
        ],
      ))),
    );
  }
}

class drwlistcard extends StatefulWidget {
  const drwlistcard({
    Key? key,
    required this.name,
    required this.titlename,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String titlename;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<drwlistcard> createState() => _drwlistcardState();
}

class _drwlistcardState extends State<drwlistcard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: ListTile(
        title: Text(
          widget.titlename,
          style: const TextStyle(
              fontFamily: "fount3",
              color: AppColor.themeColor,
              fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          widget.icon,
          color: AppColor.themeColor, // You can customize the color here
        ),
      ),
    );
  }
}
