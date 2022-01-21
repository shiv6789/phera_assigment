import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phera_assigment/screen/pie_chart_screen.dart';
import 'package:phera_assigment/widget/pie_chart.dart';

class TableScreen extends StatelessWidget {
  double decorator;
  double photographer;
  double caterer;

  TableScreen({
    required this.decorator,
    required this.caterer,
    required this.photographer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/expenses_table.svg",
              height: 80,
              width: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              textDirection: TextDirection.ltr,
              defaultColumnWidth: FixedColumnWidth(150),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                      child: Text(
                        "Photographer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        photographer.toStringAsFixed(2),
                        style: TextStyle(fontSize: 16),
                      ))
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text("Caterer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        caterer.toStringAsFixed(
                          2,
                        ),
                        style: TextStyle(fontSize: 16),
                      ))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Decorator",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        decorator.toStringAsFixed(2),
                        style: TextStyle(fontSize: 16),
                      ))
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text("Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        (decorator + photographer + caterer).toStringAsFixed(2),
                        style: TextStyle(fontSize: 16),
                      ))
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PieChartScreen(
                          decorator: decorator,
                          caterer: caterer,
                          photographer: photographer),
                    ));
              },
              color: Colors.blue.shade700,
              child: Text(
                "Pie Chart",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
