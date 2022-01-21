import 'package:flutter/material.dart';
import 'package:phera_assigment/screen/input_screen.dart';
import 'package:phera_assigment/screen/pie_chart_screen.dart';
import 'package:phera_assigment/screen/table_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputScreen(),
      // routes: {
      //   PieChartScreen.routeName: (ctx) => PieChartScreen(),
      // },
    );
  }
}
