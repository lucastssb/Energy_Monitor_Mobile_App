import 'package:energy_monitor_mobile_app/src/screens/home/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_gauges/gauges.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: Card(
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 20, right: 10, left: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SfRadialGauge(
                            title: const GaugeTitle(
                              text: 'Consumo',
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.2,
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5),
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: const <GaugePointer>[
                                    RangePointer(
                                      value: 90,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 0.2,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        positionFactor: 0.1,
                                        angle: 90,
                                        widget: Text(
                                          ' / 100',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ))
                                  ])
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Consumo Total: 100 Kwh',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                  Text('Preço Total: 100 R\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                  Text('Qualidade da Energia: Boa',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 30, left: 10),
                    child: Text(
                      'Tensão',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    child: LineChart(_createSampleData(), animate: true),
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 30, left: 10),
                    child: Text(
                      'Corrente',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    child: LineChart(_createSampleData(), animate: true),
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 30, left: 10),
                    child: Text(
                      'Potência',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    child: LineChart(_createSampleData(), animate: true),
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
