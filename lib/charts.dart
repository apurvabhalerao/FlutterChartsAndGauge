// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ChartScreen extends StatefulWidget {
//   const ChartScreen({Key? key}) : super(key: key);

//   @override
//   _ChartScreenState createState() => _ChartScreenState();
// }

// class _ChartScreenState extends State<ChartScreen> {
//   List<charts.Series<Task,String>> _seriesPieData;

//   _generateData() {
//     var pieData = [
//       new Task('Temperature', 80.8, Color(0xff3366cc)),
//       new Task('Humidity', 15.6, Color(0xff990099)),
//       new Task('Pressure', 19.2, Color(0xff109618)),
//     ];

//     _seriesPieData.add(
//       charts.Series(
//         data:pieData,
//         domainFn: (Task task,_)=>task.task,
//         measureFn: (Task task,_)=>task.taskvalue,
//         colorFn: (Task task,_)=>
//         charts.ColorUtil.fromDartColor(task.colorval),
//         id: 'demo',
//         labelAccessorFn: (Task row,_)=>'${row.taskvalue}',
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//   _seriesPieData = List<charts.Series<Task,String>>();
//     //_seriesPieData=List<charts.Series<Task,String>>();
//     _generateData();
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xff1976d2),
//             bottom: TabBar(
//               indicatorColor: Color(0xff9962D0),
//               tabs: [
//                 Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
//                 Tab(icon: Icon(FontAwesomeIcons.chartPie)),
//                 Tab(icon: Icon(FontAwesomeIcons.chartLine)),
//               ],
//             ),
//             title: Text('flutter Charts'),
//           ),
//           body: TabBarView(
//             children: [
//               Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Center(
//                         child: Column(
//                       children: <Widget>[
//                         Text('fhfuashfkj', style: TextStyle(fontSize: 24.0)),
//                         Expanded(
//                             child: charts.PieChart(
//                           _seriesPieData,
//                           animate: true,
//                           animationDuration: Duration(seconds: 5),
//                           behaviors: [
//                             new charts.DatumLegend(
//                               outsideJustification:
//                                   charts.OutsideJustification.endDrawArea,
//                               horizontalFirst: false,
//                               desiredMaxRows: 2,
//                               cellPadding:
//                                   new EdgeInsets.only(right: 4.0, bottom: 4.0),
//                               entryTextStyle: charts.TextStyleSpec(
//                                   fontFamily: 'Georgia', fontSize: 11),
//                             )
//                           ],
//                           defaultRenderer: new charts.ArcRendererConfig(
//                               arcWidth: 100,
//                               arcRendererDecorators: [
//                                 new charts.ArcLabelDecorator(
//                                     labelPosition:
//                                         charts.ArcLabelPosition.inside)
//                               ]),
//                         ))
//                       ],
//                     )),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Task {
//   String task;
//   double taskvalue;
//   Color colorval;
//   Task(this.task, this.taskvalue, this.colorval);
// }
