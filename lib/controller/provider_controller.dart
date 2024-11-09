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
            kpiDataList.length>3?kpiDataListOpenClose.add(true):kpiDataListOpenClose.add(false);
          }
        }
        notifyListeners();
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

        // Set column labels from the first table data's columns
        columnLabels = tableData
            .first.kpiResultDtoForTable!.first.dynamicGrid!.columns!
            .map((e) => e.title!)
            .toList();

        // Populate rowValues
        for (var e in tableData.first.kpiResultDtoForTable!.first.dynamicGrid!.raws!) {
          dataSource.add(e.dimDesc!);
          dataSource.add(e.factCustomerLoanOutstandingBalancePBG!.toString());
          dataSource.add(e.factCustomerLoanOutstandingBalancePBGColor!);
          dataSource.add(e.factCustomerLoanNumberOfLoansPBG!.toString());
          dataSource.add(e.factCustomerLoanNumberOfLoansPBGColor!);
          dataSource.add(e.factCustomerLoanSalesLoansAmount!.toString());
          dataSource.add(e.factCustomerLoanSalesLoansAmountColor!);
          dataSource.add(e.factCustomerLoanSalesLoansNumber!.toString());
          dataSource.add(e.factCustomerLoanSalesLoansNumberColor!);
          dataSource.add(e.factCustomerLoanDelinquency90daysRatio!.toString());
          dataSource.add(e.factCustomerLoanDelinquency90daysRatioColor!);
          dataSource.add(e.factCustomerLoanDelinquency90daysAmount!.toString());
          dataSource.add(e.factCustomerLoanDelinquency90daysAmountColor!);
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

  Future<void> openClose(index) async {
    kpiDataListOpenClose[index] = !kpiDataListOpenClose[index];
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

}
