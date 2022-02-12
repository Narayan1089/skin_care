<<<<<<< HEAD

// ignore_for_file: non_constant_identifier_names

=======
>>>>>>> 9d1641c36237219929b659d8c9ecb1f9bc69c2e2
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/widgets/colors_extension.dart';

<<<<<<< HEAD
import 'inidcator.dart';
=======
import 'indicator.dart';
>>>>>>> 9d1641c36237219929b659d8c9ecb1f9bc69c2e2

class PieChartSample1 extends StatefulWidget {
  var result_name = '';
  double? result_value;
  PieChartSample1(
      {Key? key, required this.result_name, required this.result_value})
      : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PieChartSample1State();
// }

// class PieChartSample1State extends State {
  @override
  PieChartSample1State createState() => PieChartSample1State();
}

class PieChartSample1State extends State<PieChartSample1> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.55,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: const Color.fromARGB(255, 238, 2, 2),
                  text: widget.result_name,
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color.fromARGB(255, 177, 190, 174),
                  text: 'Other',
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
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
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
            ),
            const Text(
              "Scanned Result:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 2),
            Expanded(child: Image.asset('assets/doctor_result.png')),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color.fromARGB(255, 238, 2, 2);
        const color1 = Colors.grey;
        var round_val =
            double.parse(widget.result_value!.toStringAsFixed(1)) * 100;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: round_val,
              title: '$round_val%',
              radius: 90,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0.darken(40), width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value: 25,
              title: 'Others',
              radius: 80,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color1.darken(40), width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );

          default:
            throw Error();
        }
      },
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 9d1641c36237219929b659d8c9ecb1f9bc69c2e2
