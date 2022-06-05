import 'package:flutter/material.dart';
import 'package:examen9a_parcial1/weather_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WeatherApp(),
        ),
      ),
    );
  }
}
