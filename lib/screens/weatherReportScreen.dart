// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xffde505c),
      appBar: AppBar(
        backgroundColor: Color(0xffde505c),
        elevation: 0.0,
        title: const Text(
          "Weatherman",
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              map?["region"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              map?["daysHours"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            Image(
              image: NetworkImage(map?['image']),
            ),
            Text(
              map?['temp'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "---------------",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              map?["comment"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
