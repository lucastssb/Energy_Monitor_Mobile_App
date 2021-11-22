import 'package:energy_monitor_mobile_app/src/screens/home/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:energy_monitor_mobile_app/src/models/linear_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearData, int>> _createSampleData() {
    final data = [
      LinearData(0, 5),
      LinearData(1, 25),
      LinearData(2, 100),
      LinearData(3, 60),
      LinearData(4, 30),
      LinearData(5, 80),
      LinearData(6, 35),
    ];

    return [
      charts.Series<LinearData, int>(
        id: 'data',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearData data, _) => data.second,
        measureFn: (LinearData data, _) => data.data,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Tensão'),
                ),
                SizedBox(
                  child: LineChart(_createSampleData(), animate: true),
                  height: 200,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Corrente'),
                ),
                SizedBox(
                  child: LineChart(_createSampleData(), animate: true),
                  height: 200,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Consumo'),
                ),
                SizedBox(
                  child: LineChart(_createSampleData(), animate: true),
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
