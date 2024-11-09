
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  TableDataSource(List<List<String>> rowValues) {
    _dataGridRows = rowValues.map<DataGridRow>((row) {
      return DataGridRow(
        cells: row
            .map((cell) => DataGridCell<String>(columnName: '', value: cell))
            .toList(),
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(dataCell.value.toString()),
        );
      }).toList(),
    );
  }
}