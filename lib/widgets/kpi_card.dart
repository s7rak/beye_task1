import 'package:beye_task1/models/kpi_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/provider_controller.dart';
import '../shared/color.dart';

class PbgCard extends StatefulWidget {
  final List<KpiResultDto>? kpiDataList;
  final double current;
  final int index;
  final String kpiAlias;

  const PbgCard(
      {super.key,
      this.kpiDataList,
      this.current = 0.0,
      this.kpiAlias = '',
      required this.index});

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

  void _syncData() {
    _chartData = [];
    if (widget.kpiDataList != null) {
      for (var e in widget.kpiDataList!) {
        for (var ee in e.data) {
          _chartData.add(_ChartData(ee.monthId.toString(), ee.total));
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoanSummaryProvider>(context);
    return InkWell(
      onTap: () {
        provider.openClose(widget.index);
      },
      child: AnimatedSize(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        child: !provider.kpiDataListOpenClose[widget.index]
            ? Card(
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  key: ValueKey<int>(1),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.kpiAlias}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ),
              )
            : Card(
                key: ValueKey<int>(2),
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: secondaryColor,
                    width: 10,
                  ))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.current.toStringAsFixed(2)} Mn',
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
                        '${widget.kpiAlias}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 16),
                      if (widget.kpiDataList != null)
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 100,
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <LineSeries<_ChartData, String>>[
                                    LineSeries<_ChartData, String>(
                                      dataSource: _chartData,
                                      xValueMapper: (data, _) => data.x,
                                      yValueMapper: (data, _) => data.y,
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'YOY - Growth',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
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
                                    Icon(Icons.arrow_right_alt,
                                        color: Colors.orange),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'YTD - Budget',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
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
                                    Icon(Icons.check_circle,
                                        color: Colors.green),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;

  _ChartData(this.x, this.y);
}
