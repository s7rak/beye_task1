import 'package:beye_task1/shared/color.dart';
import 'package:beye_task1/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controller/provider_controller.dart';
import '../shared/constant.dart';
import '../widgets/kpi_card.dart';
import '../widgets/shared_widgets.dart';

class LoanSummaryScreen extends StatelessWidget {
  const LoanSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoanSummaryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: provider.menuIndex,
            onDestinationSelected: (int index) {
              provider.changeMenuIndex(index);
            },
            labelType: NavigationRailLabelType.all,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(color: primaryColor),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            destinations: List.generate(
              11,
                  (index) => NavigationRailDestination(
                icon: Image.asset(
                  'assets/icons/menu ($index).png',
                  width: 30,
                  fit: BoxFit.contain,
                  color: index!=0?Colors.grey:null,
                ),
                selectedIcon: Image.asset(
                  'assets/icons/menu ($index).png',
                  width: 30,
                  fit: BoxFit.contain,
                  color: index!=0?primaryColor:null,
                ),
                label: Text(''),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
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
                                          context: context,
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
                                    border:
                                        Border.all(color: Colors.grey.shade200),
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
                        color: greyColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 10.0),
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
                                    items: <String>[
                                      'All',
                                      'Option 1',
                                      'Option 2'
                                    ].map((String value) {
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
                        Wrap(
                          children: List.generate(
                            provider.kpiDataList.length,
                            (index) => SizedBox(
                              width:
                                  MediaQuery.of(context).size.longestSide *0.29,
                              child: PbgCard(
                                kpiDataList:
                                    provider.kpiDataList[index].kpiResultDto,
                                current: provider.kpiDataList[index]
                                    .kpiResultDto.first.current,
                                kpiAlias: provider.kpiDataList[index]
                                    .kpiResultDto.first.kpiAlias,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: SfDataGrid(
                            source: TableDataSource(provider.rowValues),
                            columns: provider.columnLabels.map((label) {
                              return GridColumn(
                                columnName: label,
                                label: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                  ),
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            columnWidthMode: ColumnWidthMode.fill,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
