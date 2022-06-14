import 'dart:convert';
import 'package:http/http.dart';
import 'package:location/location.dart';

class WeatherApi {
  String? region;
  String? humidity;
  int? tempC;
  String? dayHours;
  String? comment;
  String? cloudImage;
  String? nextDay;
  String? netxtDayTemC;
  double? long;
  double? lati;
  WeatherApi(
      {this.cloudImage,
      this.comment,
      this.dayHours,
      this.humidity,
      this.netxtDayTemC,
      this.nextDay,
      this.region,
      this.tempC,
      this.long,
      this.lati});

  Future<void> getDiffirentProperties() async {
    try {
      Response response = await get(Uri.parse(
          "https://weatherdbi.herokuapp.com/data/weather/$lati,$long"));
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
