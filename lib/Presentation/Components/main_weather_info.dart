import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Data/Data Providers/colors.dart';

class MainWeatherInfo extends StatelessWidget {
  const MainWeatherInfo(
      {super.key,
      required this.textTheme,
      required this.addressName,
      required this.tempH,
      required this.tempL,
      required this.description});

  final TextTheme textTheme;
  final String addressName;
  final String tempH;
  final String tempL;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressName,
            style: textTheme.headlineMedium,
          ),
          SizedBox(width: 15),
          Text(
            'Updated 2 min ago',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorResources.lightSubtitleColor),
          ),
          SizedBox(height: 15),
          Text(
            '$tempL° - $tempH°',
            style: textTheme.bodyMedium,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorResources.lightSubtitleColor),
          ),
          SizedBox(height: 10),
          Text(
            ' ${DateFormat('EEEE, MMM d').format(DateTime.now())}',
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
