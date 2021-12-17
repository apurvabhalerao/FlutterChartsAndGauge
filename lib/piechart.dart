

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PieChart extends StatefulWidget {
  //const PieChart({ Key? key }) : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
  
}

class _PieChartState extends State<PieChart> {
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
    return SafeArea(child: Scaffold(
      body: SfCircularChart(
        title: ChartTitle(text: 'some data:'),
        legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
        dataSource: _chartData,
        xValueMapper: (GDPData data,_) =>data.continent,
        yValueMapper: (GDPData data,_) => data.gdp,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        enableTooltip: true),
        
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
        
        ],),),
      
    );
  }
List<GDPData>getChartData(){
  final List<GDPData>chartData =[
    GDPData('Temperature',1600),
    GDPData('Humidity',2490),
    GDPData('Pressure',2900),
    // GDPData('jkl',23050),
    // GDPData('mno',24880),
    // GDPData('pqr',54390),
  ];
  return chartData;
}

}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
  
}