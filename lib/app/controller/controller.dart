import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'extensions.dart';

class Controller extends GetxController {
  //userDetails
  var psId = "".obs;
  var userId = 0.obs;
  var roleId = 0.obs;
  var projectId = 0.obs;
  var userName = "".obs;
  var phoneNumber = "".obs;
  var emailId = "".obs;

  var usersListData = [].obs;
  var subContractorList = [].obs;
  var structurDetailData = [].obs;

  //oderdetails
  var orderHeaderList = [].obs;
  var segmentList = [].obs;
  var subsegmentList = [].obs;
  var elementList = [].obs;

  //
  var returnOrderURL = "".obs;
  var returnOrderTODate = "".obs;
  var returnOrderFromDate = "".obs;
  //
  var orderURL = "".obs;
  var orderTODate = "".obs;
  var orderFromDate = "".obs;

  //metiral List datas
  var activityList = [].obs;
  var materialList = [].obs;
  //"password": "T3$t@321",
  // C - http://129.154.47.8:4656/api/
  // T - http://gratest.in:4655/api/
  // var baseurl = "http://129.154.47.8:4656/api/".obs;

// New Testing server

// http://144.24.159.217:4654/api/

  // var baseurl = "http://129.154.47.8:4655/api/".obs;
  // var baseurlforlogin = "http://129.154.47.8:4655".obs;

// Client server
   var baseurl = "http://3.227.244.140:4654/api/".obs;
  var baseurlforlogin = "http://3.227.244.140:4654".obs;
  var crntScreenInex = 1.obs;

  var apiToken = "".obs;
  var getonetimedata = 0;

  //data load
  @override
  void onInit() {
    if (apiToken.value != '') {
      super.onInit();
      fetchOrderHeaderData();
      fetchStructurDetailData();
      fetchMaterialData();
      fetchUserListData();
      fetchSegmentListData();
      fetchSubsegmentListData();
      fetchSubContractorData();
      fetchelementListData();
      if (getonetimedata == 0) {
        getonetimedata = 3;
      }
    }
  }

  //fetch and store user Details on veriable
  updateUser(var data) {
    crntScreenInex.value =
        data["roleId"] != 7 ? (data["roleId"] != 2 ? 1 : 2) : 0;
    psId.value = data["psId"].toString();
    userId.value = data["userId"];
    roleId.value = data["roleId"];
    userName.value = data["userName"].toString();
    phoneNumber.value = data["phoneNumber"].toString();
    emailId.value = data["emailId"].toString();

    returnOrderDate("", "");
    orderDate("", "");
  }

//Blasting Request List URL
  returnOrderDate(var from, var to) {
    dynamic userOrderType = '';
    if (roleId.value == 2) {
      userOrderType = "sectionicReturn/$userId";
    } else if (roleId.value == 3) {
      userOrderType = "siteEngineer/Return/$userId";
    } else if (roleId.value == 7) {
      userOrderType = "formWork/Return";
    }

    if (from != '' && to != '') {
      returnOrderFromDate.value = from.toString();
      returnOrderTODate.value = to.toString();
      returnOrderURL.value =
          '${baseurl}orderList/$userOrderType/${dategetYMD(returnOrderFromDate.toString())}/${dategetYMD(returnOrderTODate.toString())}/$projectId';
    } else {
      var formatter = DateFormat('dd-MM-yyyy');
      var now = DateTime.now().add(const Duration(days: 30));
      var oneMonth = DateTime.now().subtract(const Duration(days: 30));
      returnOrderFromDate.value = formatter.format(oneMonth).toString();
      returnOrderTODate.value = formatter.format(now).toString();

      returnOrderURL.value =
          '${baseurl}orderList/$userOrderType/${dategetYMD(returnOrderFromDate.toString())}/${dategetYMD(returnOrderTODate.toString())}/$projectId';
    }
  }

  //Blasting Request List URL
  orderDate(var from, var to) {
    dynamic userOrderType = '';
    if (roleId.value == 2) {
      userOrderType = "sectionic/$userId";
    } else if (roleId.value == 3) {
      userOrderType = "siteEngineer/$userId";
    } else if (roleId.value == 7) {
      userOrderType = "formWork";
    }

    if (from != '' && to != '') {
      orderFromDate.value = from.toString();
      orderTODate.value = to.toString();
      orderURL.value =
          '${baseurl}orderList/$userOrderType/${dategetYMD(orderFromDate.value)}/${dategetYMD(orderTODate.value)}/$projectId';
      // var u = 7;
    } else {
      var formatter = DateFormat('dd-MM-yyyy');
      var now = DateTime.now().add(const Duration(days: 30));
      var oneMonth = DateTime.now().subtract(const Duration(days: 30));
      orderFromDate.value = formatter.format(oneMonth).toString();
      orderTODate.value = formatter.format(now).toString();
      orderURL.value =
          '${baseurl}orderList/$userOrderType/${dategetYMD(orderFromDate.value)}/${dategetYMD(orderTODate.value)}/$projectId';
      // var u = 7;
    }
  }

  //fetchOrderHeaderData on api
  fetchOrderHeaderData() async {
    try {
      var response = await Dio().get(
        '${baseurl}orderHeader/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      orderHeaderList.value = data;
    } catch (e) {
      null;
    }
  }

  //fetchMaterialData on api
  fetchMaterialData() async {
    try {
      var response = await Dio().get(
        '${baseurl}material/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      materialList.value = data;
    } catch (e) {
      null;
    }
  }

  //fetchStructurDetailData on api
  fetchStructurDetailData() async {
    try {
      var response = await Dio().get(
        '${baseurl}wpsStructure/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      structurDetailData.value = data;
    } catch (e) {
      null;
    }
  }

  // fetchsectionEnggListData on api
  fetchUserListData() async {
    try {
      var response = await Dio().get(
        '${baseurl}user/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      usersListData.value = data;
    } catch (e) {
      null;
    }
  }

  fetchSubContractorData() async {
    try {
      var response = await Dio().get(
        '${baseurl}subContractor/project/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      subContractorList.value = data;
    } catch (e) {
      null;
    }
  }

  //fetchSegment List Data on api
  fetchSegmentListData() async {
    try {
      var response = await Dio().get(
        '${baseurl}segment/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      segmentList.value = data;
    } catch (e) {
      null;
    }
  }

  //fetch SubsegmentListData on api
  fetchSubsegmentListData() async {
    try {
      var response = await Dio().get(
        '${baseurl}subsegment/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      subsegmentList.value = data;
    } catch (e) {
      null;
    }
  }

  //fetchelementListData on api
  fetchelementListData() async {
    try {
      var response = await Dio().get(
        '${baseurl}element/all',
        options: Options(
          headers: {"Authorization": "Bearer $apiToken"},
        ),
      );
      var data = response.data;
      elementList.value = data;
    } catch (e) {
      null;
    }
  }
}
