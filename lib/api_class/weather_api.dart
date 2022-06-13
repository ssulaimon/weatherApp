import 'dart:convert';

import 'package:http/http.dart';

class WeatherApi {
  String? region;
  String? humidity;
  int? tempC;
  String? dayHours;
  String? comment;
  String? cloudImage;
  String? nextDay;
  String? netxtDayTemC;
  WeatherApi(
      {this.cloudImage,
      this.comment,
      this.dayHours,
      this.humidity,
      this.netxtDayTemC,
      this.nextDay,
      this.region,
      this.tempC});

  Future<void> getDiffirentProperties() async {
    try {
      Response response = await get(
          Uri.parse("https://weatherdbi.herokuapp.com/data/weather/lagos"));
      Map map = await jsonDecode(response.body);
      region = map["region"];
      comment = map["currentConditions"]["comment"];
      humidity = map["currentConditions"]["humidity"];
      dayHours = map["currentConditions"]["dayhour"];
      tempC = map["currentConditions"]["temp"]["c"];
      cloudImage = map["currentConditions"]["iconURL"];
    } catch (error) {
      print(error);
    }
  }
}
