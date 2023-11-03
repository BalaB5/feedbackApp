import 'package:feedback_app/app/core/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/title_text.dart';
import 'test.dart';

class SortablePage extends StatefulWidget {
  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;
  String xAxisTitle = 'Months';

  @override
  void initState() {
    super.initState();
    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.themeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
              ScrollableWidget(child: buildDataTable()),
            ],
          ),
        ),
      );

  Widget buildDataTable() {
    final columns = ['Name', 'Customer ID', 'Mobile Number'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columnSpacing: 40, // Adjust the value according to your needs
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.name, user.customerID, user.mobileNumber];

        return DataRow(cells: getCells(cells, user));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, User user) => cells.map((data) {
        if (data.runtimeType == int) {
          return DataCell(Row(
            children: [
              Text('$data'),
              SizedBox(width: 5),
              Padding(
                padding: EdgeInsets.only(left: 17.0),
                child: Icon(Icons.remove_red_eye),
              ),
            ],
          ));
        }
        return DataCell(Text('$data'));
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.name, user2.name));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.customerID, user2.customerID));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareInt(ascending, user1.mobileNumber, user2.mobileNumber));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  int compareInt(bool ascending, int value1, int value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

class User {
  final String name;
  final String customerID;
  final int mobileNumber;

  const User({
    required this.name,
    required this.customerID,
    required this.mobileNumber,
  });

  User copy({
    String? name,
    String? customerID,
    int? mobileNumber,
  }) =>
      User(
        name: name ?? this.name,
        customerID: customerID ?? this.customerID,
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          customerID == other.customerID &&
          mobileNumber == other.mobileNumber;

  @override
  int get hashCode =>
      name.hashCode ^ customerID.hashCode ^ mobileNumber.hashCode;
}

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}

final List<User> allUsers = [
  User(name: 'Emma', customerID: '1234567', mobileNumber: 1234567890),
  User(name: 'Max', customerID: '2345678', mobileNumber: 2345678901),
  User(name: 'Sarah', customerID: '3456789', mobileNumber: 3456789012),
  User(name: 'James', customerID: '4567890', mobileNumber: 4567890123),
  User(name: 'Lorita', customerID: '5678901', mobileNumber: 5678901234),
  User(name: 'Anton', customerID: '6789012', mobileNumber: 6789012345),
  User(name: 'Salina', customerID: '7890123', mobileNumber: 7890123456),
];
