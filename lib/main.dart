import 'package:beye_task1/view/loan_summary_screen.dart';
import 'package:beye_task1/controller/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoanSummaryProvider()..loadJsonData()..loadTableData()),
      ],
      child: MaterialApp(
        title: 'Loan Summary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: false,
        ),
        home: LoanSummaryScreen(),
      ),
    );
  }
}