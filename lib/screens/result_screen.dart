// import 'package:fl_chart/fl_chart.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:skin_care/widgets/pie_chart_data.dart';
import 'package:skin_care/widgets/pie_example.dart';

class ResultScreen extends StatefulWidget {
  var result_name = '';
  double? result_value;
  ResultScreen(
      {Key? key, required this.result_name, required this.result_value})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(Icons.skip_previous))
        ],
      ),
      body: PieChartSample1(
        result_name: widget.result_name,
        result_value: widget.result_value,
      ),
    );
  }
}
