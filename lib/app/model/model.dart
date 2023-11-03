// import "package:flutter/material.dart";

// BlateRequest Material model
// class BlastingStocklistmodel {
//   BlastingStocklistmodel({
//     required this.stockID,
//     required this.materialId,
//     required this.requirdQty,
//   });

//   dynamic materialId;
//   dynamic requirdQty;
//   dynamic stockID;
// }

import '../core/data.dart';

class OrderDetails {
  OrderDetails(
    this.id,
    this.structureID,
    this.segmentID,
    this.subSegID,
    this.elementID,
    this.leght,
    this.breath,
    this.height,
    this.radius,
    this.location,
  );
  int id;
  int structureID;
  int segmentID;
  int subSegID;
  int elementID;
  double leght;
  double breath;
  double height;
  double radius;
  String location;
}
class WbsDetails {
  WbsDetails(
    this.id,
    this.structureID,
    this.segmentID,
    this.subSegID,
    this.elementID,
    this.leght,
    this.breath,
    this.height,
    this.radius,
    this.location,
  );
  int id;
  int structureID;
  int segmentID;
  int subSegID;
  int elementID;
  double leght;
  double breath;
  double height;
  double radius;
  String location;
}

class FormworkReturn {
  FormworkReturn(
     this.materialId,
    this.toStore,
    this.toScrap,
    this.missing,
    this.remark,
    
  );
  int materialId;
  int toStore;
  int toScrap;
  int missing;
  String remark;
}

class DateWiseFilterModel {
  int id;
  String name;

  DateWiseFilterModel(
    this.id,
    this.name,
  );

  static List<DateWiseFilterModel> getCompanies() {
    return <DateWiseFilterModel>[
      DateWiseFilterModel(
        1,
        TextData.cum,
      ),
      DateWiseFilterModel(2, TextData.fty),
      DateWiseFilterModel(3, TextData.ftm),
      DateWiseFilterModel(4, TextData.ftw),
      DateWiseFilterModel(
        5,
        TextData.cus,
      ),
    ];
  }
}
