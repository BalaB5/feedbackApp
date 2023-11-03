// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChartExample extends StatefulWidget {
//   @override
//   _LineChartExampleState createState() => _LineChartExampleState();
// }

// class _LineChartExampleState extends State<LineChartExample> {
//   // Example data, you should replace this with your actual data
//   final List<FlSpot> percentageData = [
//     FlSpot(1, 10),
//     FlSpot(2, 20),
//     FlSpot(3, 30),
//     // Add more data points here
//   ];

//   String xAxisTitle = 'Months';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Line Chart Example'),
//       ),
//       body: Column(
//         children: [
//           DropdownButton<String>(
//             value: xAxisTitle,
//             items: [
//               DropdownMenuItem(
//                 value: 'Months',
//                 child: Text('This Year'),
//               ),
//               DropdownMenuItem(
//                 value: 'This Month',
//                 child: Text('This Month'),
//               ),
//               DropdownMenuItem(
//                 value: 'This Week',
//                 child: Text('This Week'),
//               ),
//             ],
//             onChanged: (String? newValue) {
//               setState(() {
//                 xAxisTitle = newValue!;
//               });
//             },
//           ),
//           AspectRatio(
//             aspectRatio: 2.0,
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(show: true),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(
//                     color: const Color(0xff37434d),
//                     width: 1,
//                   ),
//                 ),
//                 minX: 1,
//                 maxX: percentageData.length.toDouble(),
//                 minY: 0,
//                 maxY: 100,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: percentageData,
//                     isCurved: true,
//                     // colors: [Colors.blue],
//                     dotData: FlDotData(show: false),
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//                 titlesData : FlTitlesData(
//                   leftTitles: const AxisTitles(
//                     sideTitles:SideTitles(showTitles: true)),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                     showTitles: true,
//                     getTitlesWidget : (value) {
//                       if (xAxisTitle == 'Months') {
//                         // Return month labels based on the X-axis value
//                         return getMonthLabel(value.toInt());
//                       } else if (xAxisTitle == 'This Month') {
//                         // Return days of the month labels
//                         return value.toString();
//                       } else {
//                         // Return day of the week labels
//                         return getDayOfWeekLabel(value.toInt());
//                       }
//                     },
//                   )
//                   ),

//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//     String getMonthLabel(int month) {
//     // Replace this with a method that returns month labels.
//     // For example, if month is 1, return 'Jan', if 2, return 'Feb', and so on.
//   }

//   String getDayOfWeekLabel(int day) {
//     // Replace this with a method that returns day of the week labels.
//     // For example, if day is 1, return 'Mon', if 2, return 'Tue', and so on.
//   }

// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyEarnings extends StatelessWidget {
  List<Color> gradientColors = const [
    Color.fromARGB(255, 5, 122, 189),
    Color(0xff02d39a),
  ];

  static Map<int, String> monthMap = const {
    0: 'JAN',
    1: 'FEB',
    2: 'MAR',
    3: 'APR',
    4: 'MAY',
    5: 'JUN',
    6: 'JUL',
    7: 'AUG',
    8: 'SEP',
    9: 'OCT',
    10: 'NOV',
    11: 'DEC',
  };

  static Map<int, String> moneyMap = const {
    0: '',
    1: '10',
    2: '20',
    3: '30',
    4: '40',
    5: '50',
    6: '60',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        // color: Constants.purpleLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        // show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromARGB(100, 100, 100, 100),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color.fromARGB(100, 100, 100, 100),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (_, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            String? month = monthMap[value.toInt()];
            if (month == null) {
              return '';
            }
            return month;
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (_, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            String? money = moneyMap[value.toInt()];
            if (money == null) {
              return '';
            }
            return money;
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.2)).toList(),
          ),
        ),
      ],
    );
  }
}
