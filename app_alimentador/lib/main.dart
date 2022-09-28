import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: const [
            Center(
              child: Text('aaaa'),
            )
          ]),
        ),
      ),
    );
  }
}
