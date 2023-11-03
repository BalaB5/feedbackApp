import 'package:get/get.dart';
import 'controller.dart';

final Controller c = Get.put(Controller());
// date formator DD/MM/YYYY
dategetDMY(String value) {
  String result;
  try {
    var value1 = value.split("T")[0];
    var value2 = value1.split("-");
    result = "${value2[2]}-${value2[1]}-${value2[0]}";
  } catch (e) {
    result = "";
  }

  return result;
}

//// date formator YYYY/MM/DD
dategetYMD(String value) {
  dynamic result;
  try {
    var value2 = value.split("-");
    result = "${value2[2]}-${value2[1]}-${value2[0]}";
  } catch (e) {
    result = null;
  }

  return result;
}

//
String getdatemonth(String date) {
  String optimized = date.toString().substring(0, 10);
  String month = optimized.substring(5, 7);
  String monthWords = "";
  String dateNumber = optimized.substring(8, 10);
  switch (month) {
    case "01":
      {
        monthWords = "Jan";
      }
      break;
    case "02":
      {
        monthWords = "Feb";
      }
      break;
    case "03":
      {
        monthWords = "Mar";
      }
      break;
    case "04":
      {
        monthWords = "Apr";
      }
      break;
    case "05":
      {
        monthWords = "May";
      }
      break;
    case "06":
      {
        monthWords = "Jun";
      }
      break;
    case "07":
      {
        monthWords = "July";
      }
      break;
    case "08":
      {
        monthWords = "Aug";
      }
      break;
    case "09":
      {
        monthWords = "Sep";
      }
      break;
    case "10":
      {
        monthWords = "Oct";
      }
      break;
    case "11":
      {
        monthWords = "Nov";
      }
      break;
    case "12":
      {
        monthWords = "Dec";
      }
  }

  return "$monthWords $dateNumber";
}

String limitTextLength(String text, int maxLength) {
  return text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';
}

// getMaterialName by MaterialId
getMaterialName(var value) {
  String result = '';
  for (var data in c.materialList) {
    if (data["materialId"] == value) {
      result = data["materialDescription"];
    }
  }

  return result;
}

//get StructurName by getStructurID
getStructurName(var value) {
  String result = '';
  for (var data in c.structurDetailData) {
    if (data["wpsStructureId"] == value) {
      result = data["wpsStructureName"];
    }
  }

  return result;
}

//getMaterialName by segmentID
String getSegmentName(int value) {
  String result = '';
  for (var data in c.segmentList) {
    if (data["segmentId"] == value) {
      result = data["segmentName"];
    }
  }

  return result;
}

//get Subsegment Name by subsegmentID
String getSubSegmentId(int value) {
  String result = '';
  for (var data in c.subsegmentList) {
    if (data["subsegmentId"] == value) {
      result = data["subsegmentName"];
    }
  }

  return result;
}

//get ElementId Name by elementID
String getElementIDName(int value) {
  String result = '';
  for (var data in c.elementList) {
    if (data["elementId"] == value) {
      result = data["elementName"];
    }
  }

  return result;
}

//get ElementId Name by elementID
String getUserName(int value) {
  String result = '';
  for (var data in c.usersListData) {
    if (data["userId"] == value) {
      result = data["userName"];
    }
  }

  return result;
}

String getSubConName(int value) {
  String result = '';
  for (var data in c.subContractorList) {
    if (data["subConId"] == value) {
      result = data["subConName"];
    }
  }

  return result;
}

genorderIDnumber(dynamic num) {
  dynamic result;
  var y = num.toString().split("");

  if (y.length < 4) {
    if (y.length == 3) {
      result = "0${y[0]}${y[1]}${y[2]}";
    }
    if (y.length == 2) {
      result = "00${y[0]}${y[1]}";
    }
    if (y.length == 1) {
      result = "000${y[0]}";
    }
  } else {
    result = num.toString();
  }

  return result;
}

String isDateExpired() {
  // Get the current date
  DateTime currentDate = DateTime.now();
  int currentYear = currentDate.year;
  int previousYear = currentYear - 1;
  int nextYear = currentYear + 1;
  String output;

  String date = "30-03-$currentYear";

  // Assuming the date is in the format 'dd/mm/yyyy'
  List<String> dateParts = date.split('-');

  // Extract day, month, and year from the date
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  // print(currentDate.toString());

  // Create a DateTime object for the given date
  DateTime givenDate = DateTime(year, month, day);
  output = givenDate.isBefore(currentDate)
      ? "$currentYear-$nextYear"
      : "$previousYear-$currentYear";

  // Compare the given date with the current date

  return output.toString();
}
