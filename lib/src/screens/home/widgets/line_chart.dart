/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final List<charts.Series<dynamic, int>> dataList;
  final bool animate;

  // ignore: prefer_const_constructors_in_immutables
  LineChart(this.dataList, {Key? key, required this.animate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      dataList,
      animate: animate,

      /// This is an OrdinalAxisSpec to match up with BarChart's default
      /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
      /// other charts).
      domainAxis: const charts.NumericAxisSpec(
          // Make sure that we draw the domain axis line.
          showAxisLine: true,
          // But don't draw anything else.
          renderSpec: charts.NoneRenderSpec()),
    );
  }
}
