import 'package:flutter/material.dart';
import 'package:phera_assigment/widget/pie_chart.dart';

class PieChartScreen extends StatelessWidget {
  static const routeName = "/pie-chart-screen";

  double decorator;
  double photographer;
  double caterer;

  PieChartScreen({
    required this.decorator,
    required this.caterer,
    required this.photographer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pie(
        caterer: caterer,
        decorator: decorator,
        photographer: photographer,
      ),
    );
  }
}
