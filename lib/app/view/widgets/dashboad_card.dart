import 'package:feedback_app/app/core/colors.dart';
import 'package:feedback_app/app/view/screens/bulk_message.dart';
import 'package:flutter/material.dart';

class DashboadCard extends StatelessWidget {
  DashboadCard({
    super.key,
    required this.scrnhight,
    required this.icon,
    required this.cardValue,
    required this.subtitle,
    required this.navigate,
  });

  final double scrnhight;
  final IconData icon;
  dynamic cardValue;
  final String subtitle;
  dynamic navigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (navigate == null) {
          return;
        }
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => navigate));
      },
      child: Container(
        height: scrnhight * 0.12,
        width: scrnhight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.inputbgclr,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: AppColor.themeColor,
                ),
                if (cardValue != null)
                  Text(
                    cardValue,
                    style: TextStyle(fontSize: 22),
                  ),
                Text(
                  subtitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}
