import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forcast_app/Business%20Logic/Bloc/weather/weather_bloc.dart';
import 'package:weather_forcast_app/Data/Repositories/weather.dart';
import 'package:weather_forcast_app/Presentation/Screens/Home/UI/HomeScreen.dart';
import 'package:weather_forcast_app/Presentation/Screens/SearchDetail/UI/search_detail.dart';

import 'Data/Data Providers/dartk_theme.dart';
import 'Data/Data Providers/light_theme.dart';
import 'Data/Services/api.dart';
import 'Presentation/Routes/route_constants.dart';
import 'Presentation/Screens/Search/UI/SearchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(WeatherForcastApp());
}

class WeatherForcastApp extends StatelessWidget with WidgetsBindingObserver {
  const WeatherForcastApp({super.key});

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => WeatherRepo(apiClient: ApiClient()),
        child: MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                  create: (BuildContext context) =>
                      WeatherBloc(weatherRepo: context.read<WeatherRepo>())
                        ..add(const FetchMyWeather())),
            ],
            child: MaterialApp(
              title: 'my weather',
              theme: darkTheme,
              routes: {
                "/": (context) => const HomeScreen(),
                MyAppRouteConstants.homeRouteName: (context) =>
                    const HomeScreen(),
                MyAppRouteConstants.searchRouteName: (context) =>
                    SearchScreen(),
                MyAppRouteConstants.searchDetialRouteName: (context) =>
                    const SearchDetial()
              },
              debugShowCheckedModeBanner: false,
            )));
  }
}
