import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../widgets/dashboad_card.dart';
import '../widgets/title_text.dart';
import 'bulk_message.dart';
import 'report.dart';
import 'test.dart';

final Controller c = Get.put(Controller());

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String xAxisTitle = 'Months';

  @override
  Widget build(BuildContext context) {
    double scrnwidth = MediaQuery.of(context).size.width;
    double scrnhight = MediaQuery.of(context).size.height;
    const title = "Dashboard";
    var icon = Icons.supervisor_account_sharp;
    var cardValue = "123";
    var subtitle = "Feedback";
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Row(
            children: [
              TitleText(title: title),
              Divider(
                color: Colors.black,
                height: 1,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DashboadCard(
                    scrnhight: scrnhight,
                    icon: icon,
                    cardValue: cardValue,
                    navigate: null,
                    subtitle: subtitle),
                DashboadCard(
                    scrnhight: scrnhight,
                    icon: Icons.message,
                    cardValue: cardValue,
                    navigate: null,
                    subtitle: "Message Send"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(title: "Feedback Report"),
              DropdownButton<String>(
                value: xAxisTitle,
                items: const [
                  DropdownMenuItem(
                    value: 'Months',
                    child: Text('This Year'),
                  ),
                  DropdownMenuItem(
                    value: 'This Month',
                    child: Text('This Month'),
                  ),
                  DropdownMenuItem(
                    value: 'This Week',
                    child: Text('This Week'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    xAxisTitle = newValue!;
                  });
                },
              ),
            ],
          ),
          DailyEarnings(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                TitleText(title: "Our service"),
                Divider(
                  color: Colors.black,
                  height: 1,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DashboadCard(
                  scrnhight: scrnhight,
                  icon: Icons.message,
                  navigate: const DrawerScreen(),
                  cardValue: null,
                  subtitle: "Bulk Message"),
              DashboadCard(
                  scrnhight: scrnhight,
                  icon: Icons.sticky_note_2_rounded,
                  cardValue: null,
                  navigate: SortablePage(),
                  subtitle: "Reports"),
            ],
          ),
        ],
      ),
    );
  }
}
