import 'package:flutter/material.dart';
import 'package:weather_forcast_app/Presentation/Screens/Search/UI/SearchScreen.dart';

import '../../../../Data/Data Providers/app_constants.dart';

class WeatherCard extends StatelessWidget {
  final WeatherCardData data;

  WeatherCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: data.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Temperature and location
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [Colors.white, Colors.grey[300]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        '${data.temperature}°',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Gradient applies over this
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'H:${data.highTemp}°  L:${data.lowTemp}°',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Weather icon and condition
              Column(
                children: [
                  Image.network(
                    "${AppConstants.iconBaseUrl}/${data.conditionIcon}@2x.png",
                    // "https://openweathermap.org/img/wn/10d@2x.png",
                    width: 80,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Icon(Icons.cloud,
                          size: 180,
                          color: data.textTheme.headlineMedium?.color
                              ?.withOpacity(0.2));
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.condition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
