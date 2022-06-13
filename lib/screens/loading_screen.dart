// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../api_class/weather_api.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? region;
  String? humidity;
  String? comment;
  String? daysHours;
  int? temp;
  String? imageUrl;
  void pushToNextScreen() async {
    WeatherApi weatherApi = WeatherApi();
    await weatherApi.getDiffirentProperties();

    region = weatherApi.region;
    humidity = weatherApi.humidity;
    comment = weatherApi.comment;
    daysHours = weatherApi.dayHours;
    temp = weatherApi.tempC;
    imageUrl = weatherApi.cloudImage;
    String tempString = temp.toString();
    Navigator.popAndPushNamed(context, 'weatherReportScreen', arguments: {
      'region': region,
      'humidity': humidity,
      'comment': comment,
      'daysHours': daysHours,
      'temp': tempString,
      'image': imageUrl
    });
  }

  @override
  void initState() {
    super.initState();
    pushToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LoadingAnimationWidget.beat(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
