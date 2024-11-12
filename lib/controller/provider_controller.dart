import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/kpi_data.dart';
import '../models/table_data.dart';


class LoanSummaryProvider with ChangeNotifier {
  List<KpiResult> kpiDataList = [];
  List<bool> kpiDataListOpenClose = [];
  List<TableData> tableData = [];
  List<String> columnLabels = [];
  List<List<String>> rowValues = [];

  @override
  void dispose() {
    // Dispose any resources like streams or controllers
    super.dispose();
  }

  Future<void> loadJsonData() async {
    try {
      kpiDataList = [];
      kpiDataListOpenClose = [];
      String data = await rootBundle.loadString('assets/Loan Summary JSON Data.txt');
      var jsonData = jsonDecode(data);

      if (jsonData is List) {
        for (var e in jsonData) {
          if (e["componentId"] == 3) {
            kpiDataList.add(KpiResult.fromJson(e));
            kpiDataList.length<=3?kpiDataListOpenClose.add(true):kpiDataListOpenClose.add(false);
          }
        }
        kpiDataListOpenClose.add(false);
        kpiDataListOpenClose.add(false);
        kpiDataListOpenClose.add(false);
        notifyListeners();
        print(kpiDataListOpenClose);
      } else {
        print("JSON is not a List");
      }
    } catch (e) {
      print("Error loading asset: $e");
    }
  }

  Future<void> loadTableData() async {
    try {
      tableData = [];
      List<String> dataSource = [];
      rowValues = [];
      String data = await rootBundle.loadString('assets/Loan Summary JSON Data.txt');
      var jsonData = jsonDecode(data);

      if (jsonData is List) {
        for (var e in jsonData) {
          if (e["componentId"] == 9) {
            tableData.add(TableData.fromJson(e));
          }
        }


        columnLabels = tableData
            .first.kpiResultDtoForTable!.first.dynamicGrid!.columns!
            .map((e) => e.title!)
            .toList();

        columnLabels.removeWhere((e)=>e.contains('color'));


        for (var e in tableData.first.kpiResultDtoForTable!.first.dynamicGrid!.raws!) {
          dataSource.add(e.dimDesc!);
          dataSource.add(e.factCustomerLoanOutstandingBalancePBG!.toString());
          dataSource.add(e.factCustomerLoanNumberOfLoansPBG!.toString());
          dataSource.add(e.factCustomerLoanSalesLoansAmount!.toString());
          dataSource.add(e.factCustomerLoanSalesLoansNumber!.toString());
          dataSource.add(e.factCustomerLoanDelinquency90daysRatio!.toString());
          dataSource.add(e.factCustomerLoanDelinquency90daysAmount!.toString());
          rowValues.add(dataSource);
          dataSource = [];
        }

        notifyListeners();
      } else {
        print("JSON is not a List");
      }
    } catch (e) {
      print("Error loading asset: $e");
    }
  }


  Future<void> openClose(int index) async {
    kpiDataListOpenClose[index] = !kpiDataListOpenClose[index];

    if (kpiDataListOpenClose[index]) {
      Map<int, List<int>> toggleMap = {
        0: [3, 6],
        3: [0, 6],
        6: [3, 0],
        4: [1, 7],
        1: [4, 7],
        7: [1, 4],
        5: [2, 8],
        8: [2, 5],
        2: [5, 8],
      };

      toggleMap[index]?.forEach((i) => kpiDataListOpenClose[i] = false);
    }

    notifyListeners();
  }



  int productIndex = 0;

  Future<void> changeProductIndex(index) async {
    productIndex = index;
    notifyListeners();
  }

  int menuIndex = 2;

  Future<void> changeMenuIndex(index) async {
    menuIndex = index;
    notifyListeners();
  }

  List<String> sortColumn = [];
  bool sortAscending = true;
  void sort<T>(String columnName, bool ascending, bool isNumeric) {
      sortColumn = columnLabels;
      sortAscending = ascending;
      rowValues.sort((a, b) {
        final aValue = a[columnLabels.indexOf(columnName)];
        final bValue = b[columnLabels.indexOf(columnName)];
        if (isNumeric) {
          return ascending
              ? double.parse(aValue).compareTo(double.parse(bValue))
              : double.parse(bValue).compareTo(double.parse(aValue));
        } else {
          return ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
        }
      });
      notifyListeners();
  }

}
