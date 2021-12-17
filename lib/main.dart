import 'package:first/pass.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Generate Random'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var temp = 0;
  final a = 'Generate Random Number: ';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$a' + '$temp',
          style: TextStyle(fontSize: 50),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              temp = Random().nextInt(100000);
            });
          },
          child: Text('Generate Random Number'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PassScreen();
                  },
                ),
              );
            });
          },
          child: Text('next'),
        ),
      ],
    ))));
  }
}
