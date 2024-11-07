import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/kpi_data.dart';
//
// class DataService {
//   Future<List<KpiData>> getKpiData() async {
//     final jsonString = await rootBundle.loadString('assets/Loan Summary JSON Data.txt');
//     final List<dynamic> jsonList = json.decode(jsonString);
//     return jsonList
//         .where((item) => item['componentId'] == 3)
//         .map((item) => KpiData.fromJson(item['kpiResultDto'][0]))
//         .toList();
//   }
// }
//