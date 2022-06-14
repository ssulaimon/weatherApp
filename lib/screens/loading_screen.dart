// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location/location.dart';

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
  PermissionStatus? permissionStatus;
  LocationData? locationData;

  void pushToNextScreen() async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      location.requestService();
      if (!serviceEnabled) {
        WeatherApi weatherApi = WeatherApi(long: 73.935242, lati: 40.730610);
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
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        WeatherApi weatherApi = WeatherApi(long: 73.935242, lati: 40.730610);
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
    }
    locationData = await location.getLocation();

    WeatherApi weatherApi =
        WeatherApi(long: locationData?.longitude, lati: locationData?.latitude);
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
