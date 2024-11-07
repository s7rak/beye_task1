import 'package:beye_task1/shared/color.dart';
import 'package:beye_task1/shared/global_var.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LoanSummaryScreen extends StatefulWidget {
  @override
  _LoanSummaryScreenState createState() => _LoanSummaryScreenState();
}

class _LoanSummaryScreenState extends State<LoanSummaryScreen> {
  // final List<KpiData> kpiDataList = [
  //   KpiData(kpiAlias: 'Outstanding Balance', current: 123456.78, chartData: [
  //     ChartData(1, 100),
  //     ChartData(2, 120),
  //     ChartData(3, 140),
  //     ChartData(4, 110),
  //   ]),
  //   KpiData(kpiAlias: 'Total Loans', current: 876543.21, chartData: [
  //     ChartData(1, 200),
  //     ChartData(2, 220),
  //     ChartData(3, 240),
  //     ChartData(4, 230),
  //   ]),
  //   // Add more KPI cards as needed
  // ];
  //
  // // Sample columns and rows for the DataTable
  // final List<GridColumn> columns = [
  //   GridTextColumn(columnName: 'id', label: Text('ID')),
  //   GridTextColumn(columnName: 'name', label: Text('Name')),
  //   GridTextColumn(columnName: 'value', label: Text('Value')),
  // ];
  //
  // final List<DataGridRow> rows = [
  //   DataGridRow(cells: [
  //     DataGridCell(columnName: 'id', value: '1'),
  //     DataGridCell(columnName: 'name', value: 'John Doe'),
  //     DataGridCell(columnName: 'value', value: '100'),
  //   ]),
  //   DataGridRow(cells: [
  //     DataGridCell(columnName: 'id', value: '2'),
  //     DataGridCell(columnName: 'name', value: 'Jane Doe'),
  //     DataGridCell(columnName: 'value', value: '200'),
  //   ]),
  //   // Add more rows as needed
  // ];

  List<String> columnLabels = [
    '#',
    'Branch',
    'PBG Loans & Advances',
    '# of Active PBG Loans',
    'PBG Loans Sales',
    '# of Sold PBG Tickets',
    'Delinquent Loans +90 Day %',
    'Balance of Delinquent PBG Loans +90 Day'
  ];

  final List<String> items = [
    'Products',
    'Loans & Advances',
    'Personal Banking',
    'Loans Summary (As of 30-Apr-17)',
  ];

  List<List<String>> rowValues = [
    [
      '1',
      'Branch Name',
      '654.63 Mn',
      '78.56 K',
      '78.56 K',
      '78.56 K',
      '78.56 K',
      '78.56 K'
    ],
    [
      '2',
      'Branch Name',
      '654.63 Mn',
      '78.56 K',
      '78.56 K',
      '78.56 K',
      '78.56 K',
      '78.56 K'
    ],
    // Add more rows as needed
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10))),
                        margin: EdgeInsetsDirectional.only(start: 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/icons/title_icons.png',
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Loans Summary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return rowItem(
                                    labelText: items[index],
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      9,
                          (index) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(end: 15),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/Icons ($index).png",
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                          if (index == 0 || index == 4)
                            Container(
                              height: 30,
                              width: 2,
                              color: Colors.grey.shade200,
                              margin: EdgeInsetsDirectional.only(end: 10),
                            )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Product:',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: 'All',
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: <String>['All', 'Option 1', 'Option 2']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: PbgCard()),
                      Expanded(child: PbgCard()),
                      Expanded(child: PbgCard()),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,  // Background color of the table
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: DataTable(
                      headingTextStyle: TextStyle(color: Colors.white),
                      border: TableBorder(
                        horizontalInside: BorderSide(color: greyColor),
                        verticalInside: BorderSide(color: greyColor),
                      ),
                      headingRowColor: MaterialStateProperty.all(secondaryColor),
                      columns: columnLabels.map((label) {
                        return DataColumn(label: Flexible(child: Text(label)));
                      }).toList(),
                      rows: rowValues.map((row) {
                        return DataRow(
                          cells: row.map((cell) => DataCell(Text(cell))).toList(),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowItem({
    required String labelText,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        productIndex = index;
        setState(() {});
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              labelText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: productIndex == index ? Colors.black : Colors.grey),
            ),
          ),
          SizedBox(width: 10),
          if (index != items.length - 1)
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
        ],
      ),
    );
  }
}

class PbgCard extends StatefulWidget {
  @override
  _PbgCardState createState() => _PbgCardState();
}

class _PbgCardState extends State<PbgCard> {
  List<_ChartData> _chartData = [];

  @override
  void initState() {
    super.initState();
    _syncData();
  }

  // Synchronous function to fetch chart data
  void _syncData() {
    // Sample data points
    _chartData = [
      _ChartData(0, 1),
      _ChartData(1, 3),
      _ChartData(2, 1.5),
      _ChartData(3, 4),
      _ChartData(4, 3.2),
      _ChartData(5, 4.5),
      _ChartData(6, 3.8),
    ];
    setState(() {}); // Refresh the UI with new data
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: primaryColor, // Set the color of the bottom border
              width: 8, // Set the width of the bottom border
            ),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '654.96 Mn',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            Text(
              'PBG Loans & Advances',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: SfCartesianChart(
                      primaryXAxis: NumericAxis(isVisible: false),
                      primaryYAxis: NumericAxis(isVisible: false),
                      plotAreaBorderWidth: 0,
                      series: <CartesianSeries<dynamic, dynamic>>[
                        LineSeries<_ChartData, double>(
                          dataSource: _chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          color: Colors.blueAccent,
                          width: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOY - Growth',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Row(
                      children: [
                        Text(
                          '16,598.63K',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_right_alt, color: Colors.orange),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'YTD - Budget',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Row(
                      children: [
                        Text(
                          '16,598.63K',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for the chart points
class _ChartData {
  final double x;
  final double y;

  _ChartData(this.x, this.y);
}