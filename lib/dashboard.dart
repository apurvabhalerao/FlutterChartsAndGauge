//import 'package:first/charts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}




class _Dashboard extends State<Dashboard> {
    late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override

void initState(){
  _chartData =getChartData();
  _tooltipBehavior = TooltipBehavior(enable: true); 
  super.initState();

}

@override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:(Row(
            children: [
             SfRadialGauge(
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
          const SizedBox(height: 12),
     Column(children: [
       SfCircularChart(
        title: ChartTitle(text: 'some data:'),
        legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
        dataSource: _chartData,
        xValueMapper: (GDPData data,_) =>data.continent,
        yValueMapper: (GDPData data,_) => data.gdp,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        enableTooltip: true),],)   
        
          ],
          
        //  //series: <CircularSeries>[
        //   PieSeries<GDPData, String>(
        // dataSource: _chartData,
        // xValueMapper: (GDPData data,_) =>data.continent,
        // yValueMapper: (GDPData data,_) => data.gdp,
        // dataLabelSettings: DataLabelSettings(isVisible: true),
        // enableTooltip: true),

        // RadialBarSeries<GDPData, String>(
        // dataSource: _chartData,
        // xValueMapper: (GDPData data,_) =>data.continent,
        // yValueMapper: (GDPData data,_) => data.gdp,
        // dataLabelSettings: DataLabelSettings(isVisible: true),
        // enableTooltip: true,
        // maximumValue: 40000),
        
          )],
          )
          ),

      
          ),
          
          ),    
      );
    //   ),
    // );
      }
}
   


List<GDPData>getChartData(){
  final List<GDPData>chartData =[
    GDPData('Temperature',1600),
    GDPData('Humidity',2490),
    GDPData('Pressure',2900),
  ];
  return chartData;
}



class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
  
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
