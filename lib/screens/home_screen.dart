import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  String? region;
  String? daysHours;
  String? image;
  String? comment;
  String? temp;
  String? humidity;
  HomeScreen(
      {Key? key,
      this.region,
      this.daysHours,
      this.image,
      this.comment,
      this.temp,
      this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/night.png"),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_city_outlined,
                  color: Colors.white,
                ),
                Text(
                  region.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              daysHours.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(
              image: NetworkImage(
                image.toString(),
              ),
              height: 200.0,
              width: 200.0,
            ),
            Text(
              '${temp.toString()}°',
              style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  fontFamily: "IBM"),
            ),
            Text(
              "------------------",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              comment.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
