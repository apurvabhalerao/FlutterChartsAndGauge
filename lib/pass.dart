import 'package:first/charts.dart';
import 'package:first/dashboard.dart';
import 'package:first/piechart.dart';
import 'package:first/radialGauge.dart';
import 'package:first/simplelinechart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PassScreen extends StatefulWidget {
  const PassScreen({Key? key}) : super(key: key);

  @override
  _PassScreenState createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  final controller = TextEditingController();
  @override
  void Dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Random Password Generator',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                //readOnly: true,
                enableInteractiveSelection: false,
              ),
              const SizedBox(height: 12),
              buildButton(),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return RadialGauge();
                        },
                      ),
                    );
                  });
                },
                child: Text('Button for RadialGauge'),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return PieChart();
                        },
                      ),
                    );
                  });
                },
                child: Text('Button for pieChart'),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LineChart() ;
                        },
                      ),
                    );
                  });
                },
                child: Text('Button for LineChart'),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Dashboard() ;
                        },
                      ),
                    );
                  });
                },
                child: Text('Button for Dashboard'),
              ),

            ],
          ),
        ),
      );

  Widget buildButton() {
    final backgroundColor =
        MaterialStateColor.resolveWith((states) => Colors.black);

    return ElevatedButton(
      style: ButtonStyle(backgroundColor: backgroundColor),
      child: Text('Generate Password'),
      onPressed: () {
        final password = generatePassword();
        controller.text = password;
      },
    );
  }

  String generatePassword() {
    final length = 10;
    final lettersLowercase = 'abcdefghijklmnopqrstuvwxyz';
    final lettersUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final special = '@#=+!%&?\(){}';

    String chars = '';
    chars += '$lettersLowercase$lettersUppercase';
    chars += '$numbers';
    chars += '$special';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }
}
