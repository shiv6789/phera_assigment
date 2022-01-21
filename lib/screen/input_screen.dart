import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phera_assigment/screen/pie_chart_screen.dart';
import 'package:phera_assigment/screen/table_screen.dart';

class InputScreen extends StatelessWidget {
  final _decoratorController = TextEditingController();
  final _catererController = TextEditingController();
  final _photographerController = TextEditingController();

  double decorator = 0;
  double caterer = 0;
  double photographer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/1.svg",
              color: Colors.blue,
              height: 100,
              width: 50,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _decoratorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Decorator Expenditure",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _decoratorController.clear();
                      },
                      icon: Icon(Icons.clear))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _photographerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Photographer Expenditure",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _photographerController.clear();
                      },
                      icon: Icon(Icons.clear))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _catererController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Caterer Expenditure",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _catererController.clear();
                      },
                      icon: Icon(Icons.clear))),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                decorator = double.parse(_decoratorController.text);
                caterer = double.parse(_catererController.text);
                photographer = double.parse(_photographerController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TableScreen(
                        caterer: caterer,
                        decorator: decorator,
                        photographer: photographer,
                      ),
                    ));
                // Navigator.of(context).pushNamed(PieChartScreen.routeName);
              },
              color: Colors.blue,
              child: Text(
                "SUBMIT",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
