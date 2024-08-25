import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forcast_app/Data/Data%20Providers/colors.dart';
import 'package:weather_forcast_app/Presentation/Routes/route_constants.dart';

import '../../../../Business Logic/Bloc/weather/weather_bloc.dart';
import '../Widgets/weather_card.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeH = size.height;
    double sizeW = size.width;
    TextTheme _textTheme = Theme.of(context).textTheme;
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    TextEditingController _searchTextController =
        TextEditingController(text: "");
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _searchTextController,
                          decoration: InputDecoration(
                            hintText: "Search for a city",
                            hintStyle: _textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              color: _textTheme.bodyMedium?.color,
                              // color: Theme.of(context).iconTheme.color
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          weatherBloc.add(
                              SearchWeather(_searchTextController.value.text));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Search",
                          ),
                        ))
                  ],
                ),
              ),
              BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var weatherData = state.searchResults;
                    print("%%%%%%%%%% ---- $weatherData");
                    return state.status.isLoading
                        ? Container(
                            height: sizeH * 0.6,
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: ColorResources.primaryColor),
                            ),
                          )
                        : weatherData == null
                            ? Container(
                                height: sizeH * 0.6,
                                child: Center(
                                    child: Text(
                                  "Enter City name to search weather",
                                  style: _textTheme.bodyLarge?.copyWith(
                                      color: ColorResources.accentColor),
                                )),
                              )
                            : weatherData.isEmpty
                                ? Container(
                                    height: sizeH * 0.6,
                                    child: Center(
                                        child: Text(
                                      "No Weather Data found :(",
                                      style: _textTheme.bodyLarge?.copyWith(
                                          color: ColorResources.accentColor),
                                    )),
                                  )
                                : Container(
                                    height: sizeH * 0.6,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ListView.builder(
                                        itemCount: weatherData.length,
                                        itemBuilder: (context, index) {
                                          var data = weatherData[0];
                                          var weatherCardData = WeatherCardData(
                                              temperature: data.temp,
                                              highTemp: data.tempMax,
                                              lowTemp: data.tempMin,
                                              location: data.name +
                                                  ", " +
                                                  data.country,
                                              condition: data.description,
                                              weatherIcon: Icons.sunny,
                                              gradientColors: ColorResources
                                                  .coldGradientColor,
                                              conditionIcon: data.icon,
                                              textTheme: _textTheme);
                                          return InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context,
                                                    MyAppRouteConstants
                                                        .searchDetialRouteName,
                                                    arguments:
                                                        weatherData[index]);
                                              },
                                              child:
                                                  WeatherCard(weatherCardData));
                                        },
                                      ),
                                    ),
                                  );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCardData {
  final String temperature;
  final String highTemp;
  final String lowTemp;
  final String location;
  final String condition;
  final IconData weatherIcon;
  final List<Color> gradientColors;
  final String conditionIcon;
  final TextTheme textTheme;

  WeatherCardData(
      {required this.temperature,
      required this.highTemp,
      required this.lowTemp,
      required this.location,
      required this.condition,
      required this.weatherIcon,
      required this.gradientColors,
      required this.conditionIcon,
      required this.textTheme});
}
