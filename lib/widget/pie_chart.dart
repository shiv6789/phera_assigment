import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './indicator.dart';

class Pie extends StatefulWidget {
  double decorator;
  double photographer;
  double caterer;

  Pie({
    required this.decorator,
    required this.caterer,
    required this.photographer,
  });
  @override
  State<Pie> createState() => _PieState(
      caterer: caterer, decorator: decorator, photographer: photographer);
}

class _PieState extends State<Pie> {
  double decorator;
  double photographer;
  double caterer;

  _PieState({
    required this.decorator,
    required this.caterer,
    required this.photographer,
  });

  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 20,
                      sections: showingSections()),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'Decorator',
                  isSquare: true,
                ),
                SizedBox(
                  width: 4,
                ),
                Indicator(
                  color: Colors.lightGreen,
                  text: 'Photographer',
                  isSquare: true,
                ),
                SizedBox(
                  width: 4,
                ),
                Indicator(
                  color: Colors.orange,
                  text: 'Caterer',
                  isSquare: true,
                ),
                // SizedBox(
                //   height: 4,
                // ),
                // Indicator(
                //   color: Color(0xff13d38e),
                //   text: 'Fourth',
                //   isSquare: true,
                // ),
                // SizedBox(
                //   height: 18,
                // ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue[700],
            value: ((decorator / (decorator + photographer + caterer)) * 100),
            title: ((decorator / (decorator + photographer + caterer)) * 100)
                    .toStringAsFixed(2) +
                "%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            // badgeWidget: Badge(
            //   'https://www.svgrepo.com/svg/91430/fast-food.svg',
            //   size: widgetSize,
            //   borderColor: const Color(0xfff8b251),
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: ((caterer / (decorator + photographer + caterer)) * 100),
            title: ((caterer / (decorator + photographer + caterer)) * 100)
                    .toStringAsFixed(2) +
                "%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.lightGreen,
            value:
                ((photographer / (decorator + photographer + caterer)) * 100),
            title: ((photographer / (decorator + photographer + caterer)) * 100)
                    .toStringAsFixed(2) +
                "%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        // case 3:
        //   return PieChartSectionData(
        //     color: const Color(0xff13d38e),
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: const Color(0xffffffff)),
        //   );
        default:
          throw 'Oh no';
      }
    });
  }
}
