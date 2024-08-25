import 'package:flutter/material.dart';

import '../../Data/Data Providers/colors.dart';

class BottomWeatherDetail extends StatelessWidget {
  const BottomWeatherDetail(
      {super.key,
      required this.textTheme,
      required this.humidity,
      required this.windSpeed,
      required this.cloud,
      required this.feels});

  final TextTheme textTheme;
  final String humidity;
  final String windSpeed;
  final String cloud;
  final String feels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Feels Like : ',
                  style: textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 30),
                Text(
                  '$feels°',
                  style: textTheme.bodySmall?.copyWith(
                      color: textTheme.bodySmall?.color?.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(
              thickness: 1,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.1)),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherDetailItem(Icons.water_drop_outlined, 'Humidity',
                  '$humidity%', textTheme),
              weatherDetailItem(
                  Icons.air_outlined, 'Wind', '$windSpeed km/h', textTheme),
              weatherDetailItem(Icons.cloud_queue_outlined, 'Precipitation',
                  '$cloud%', textTheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget weatherDetailItem(
      IconData icon, String title, String value, TextTheme textTheme) {
    return Column(
      children: [
        Icon(icon, size: 28, color: ColorResources.primaryColor),
        SizedBox(height: 8),
        Text(title,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
            )),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 86, 87, 114))),
      ],
    );
  }
}
