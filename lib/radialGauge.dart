//import 'package:first/charts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatefulWidget {
  const RadialGauge({Key? key}) : super(key: key);

  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SfRadialGauge(
            title: GaugeTitle(
              text: 'Speedometer',
              textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            enableLoadingAnimation: true,
            animationDuration: 4500,
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 150,
                //pointers:<GaugePointer>[WidgetPointer(value:90)],
                // pointers:<GaugePointer>[RangePointer(value: 90,enableAnimation: true,)],
                //pointers:<GaugePointer>[MarkerPointer(value: 90,enableAnimation: true,)],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: 90,
                    enableAnimation: true,
                  )
                ],
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                  GaugeRange(
                      startValue: 50, endValue: 100, color: Colors.orange),
                  GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text(
                      '90.0MPH',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    positionFactor: 0.5,
                    angle: 90,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
    









// Column(children: [
// const SizedBox(height: 12),
//         ElevatedButton(
//       onPressed: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) {
//                 return ChartScreen();
//               },
//             ),
//           );
//         });
//       },
//       child: Text('next'),
//     ),