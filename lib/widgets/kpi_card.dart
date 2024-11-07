// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
//
// import '../models/chart_data.dart';
// import '../models/kpi_data.dart';
//
// class KpiCard extends StatelessWidget {
//   final KpiData kpiData;
//
//   const KpiCard({Key? key, required this.kpiData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200, // Set width for each card for horizontal scrolling
//       margin: EdgeInsets.all(8.0),
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(blurRadius: 4, color: Colors.grey.shade300),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(kpiData.kpiAlias, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           SizedBox(height: 8),
//           Text('${kpiData.current.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, color: Colors.blue)),
//           SizedBox(height: 8),
//           SizedBox(
//             height: 150,  // Set a fixed height for the chart
//             child: SfCartesianChart(
//               series: <LineSeries<ChartData, double>>[
//                 LineSeries<ChartData, double>(
//                   dataSource: kpiData.chartData,
//                   xValueMapper: (data, _) => data.x,
//                   yValueMapper: (data, _) => data.y,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
