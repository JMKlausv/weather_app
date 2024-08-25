import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_forcast_app/Data/Models/weather.dart';

import '../../../Components/bottom_weather_detial.dart';
import '../../../Components/main_weather_info.dart';
import '../../../Components/weather_degree.dart';

class SearchDetial extends StatelessWidget {
  const SearchDetial({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeH = size.height;
    TextTheme _textTheme = Theme.of(context).textTheme;
    final WeatherModel weatherData =
        ModalRoute.of(context)?.settings.arguments as WeatherModel;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        // Weather content
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeatherDegree(
                              textTheme: _textTheme,
                              sizeH: sizeH,
                              temp: weatherData.temp,
                              icon: weatherData.icon,
                            ),
                            MainWeatherInfo(
                                textTheme: _textTheme,
                                addressName:
                                    '${weatherData.name}, ${weatherData.country}',
                                tempH: weatherData.tempMax,
                                tempL: weatherData.tempMin,
                                description: weatherData.description),
                          ],
                        ),
                        const Spacer(),
                        // Bottom weather details
                        BottomWeatherDetail(
                          textTheme: _textTheme,
                          humidity: weatherData.humidity,
                          windSpeed: weatherData.windSpeed,
                          cloud: weatherData.clouds,
                          feels: weatherData.feels,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
