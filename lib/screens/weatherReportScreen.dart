// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';

class WeatherReportScreen extends StatefulWidget {
  const WeatherReportScreen({Key? key}) : super(key: key);

  @override
  State<WeatherReportScreen> createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  @override
  void initState() {
    super.initState();
  }

  Map? map;

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
      body: HomeScreen(
        region: map?["region"],
        daysHours: map?['daysHours'],
        image: map?['image'],
        comment: map?['comment'],
        temp: map?['temp'],
        humidity: map?['humidity'],
      ),
    );
  }
}
