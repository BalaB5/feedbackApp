import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatefulWidget {
  @override
  _LineChartExampleState createState() => _LineChartExampleState();
}

class _LineChartExampleState extends State<LineChartExample> {
  // Example data, you should replace this with your actual data
  final List<FlSpot> percentageData = [
    FlSpot(1, 10),
    FlSpot(2, 20),
    FlSpot(3, 30),
    // Add more data points here
  ];

  String xAxisTitle = 'Months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart Example'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: xAxisTitle,
            items: [
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
          AspectRatio(
            aspectRatio: 2.0,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                // titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                minX: 1,
                maxX: percentageData.length.toDouble(),
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: percentageData,
                    isCurved: true,
                    colors: [Colors.blue],
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      if (xAxisTitle == 'Months') {
                        // Return month labels based on the X-axis value
                        return getMonthLabel(value.toInt());
                      } else if (xAxisTitle == 'This Month') {
                        // Return days of the month labels
                        return value.toString();
                      } else {
                        // Return day of the week labels
                        return getDayOfWeekLabel(value.toInt());
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getMonthLabel(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return ''; // Handle invalid values
    }
  }

  String getDayOfWeekLabel(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return ''; // Handle invalid values
    }
  }
}
