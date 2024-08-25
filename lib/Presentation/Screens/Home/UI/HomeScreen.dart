import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forcast_app/Business%20Logic/Bloc/weather/weather_bloc.dart';

import '../../../../Data/Data Providers/colors.dart';
import '../../../Components/bottom_weather_detial.dart';
import '../../../Components/weather_degree.dart';
import '../../../Components/main_weather_info.dart';
import '../../../Routes/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeH = size.height;
    double sizeW = size.width;
    TextTheme _textTheme = Theme.of(context).textTheme;
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: BlocConsumer<WeatherBloc, WeatherState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var currentWeather = state.currentWeather;
                        return state.status.isLoading
                            ? Container(
                                height: sizeH,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: ColorResources.primaryColor),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 30),
                                    Container(
                                      width: sizeW,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              MyAppRouteConstants
                                                  .searchRouteName);
                                        },
                                        icon: Icon(
                                          Icons.search,
                                          color: ColorResources.accentColor,
                                        ),
                                        iconSize: 36,
                                        alignment: Alignment.centerRight,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        WeatherDegree(
                                          textTheme: _textTheme,
                                          sizeH: sizeH,
                                          temp: currentWeather?.temp ?? "",
                                          icon: currentWeather?.icon ?? "",
                                        ),
                                        MainWeatherInfo(
                                          textTheme: _textTheme,
                                          addressName:
                                              "${currentWeather?.name}, ${currentWeather?.country}",
                                          tempH: currentWeather?.tempMax ?? "",
                                          tempL: currentWeather?.tempMin ?? "",
                                          description: currentWeather?.description ??""
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    // Bottom weather details
                                    BottomWeatherDetail(
                                      textTheme: _textTheme,
                                      humidity: currentWeather?.humidity ?? "",
                                      windSpeed:
                                          currentWeather?.windSpeed ?? "",
                                      cloud: currentWeather?.clouds ?? "",
                                      feels: currentWeather?.feels ?? "",
                                    )
                                  ],
                                ),
                              );
                      }),
                ),
              ),
            );
          }),
        ));
  }

  // Weather detail item widget for bottom section
}
