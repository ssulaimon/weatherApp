import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/screens/weatherReportScreen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "loading",
      routes: {
        "loading": (context) => const LoadingScreen(),
        "weatherReportScreen": (context) => const WeatherReportScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
