import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forcast_app/Data/Data%20Providers/app_constants.dart';

import '../../Data/Data Providers/colors.dart';

class WeatherDegree extends StatelessWidget {
  WeatherDegree(
      {super.key,
      required this.textTheme,
      required this.sizeH,
      required this.temp,
      required this.icon});

  final TextTheme textTheme;
  final double sizeH;
  final String temp;
  final String icon;
  String? apiKey = dotenv.env['API_KEY'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: sizeH * 0.4,
        padding: const EdgeInsets.only(bottom: 28),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, left: 0),
                child: Image.network(
                  "${AppConstants.iconBaseUrl}/$icon@2x.png",
                  // "https://openweathermap.org/img/wn/10d@2x.png",
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Icon(Icons.cloud,
                        size: 180,
                        color:
                            textTheme.headlineMedium?.color?.withOpacity(0.2));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: ColorResources.coldGradientColor,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ).createShader(bounds);
                },
                child: Text(
                  '${temp}°',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
