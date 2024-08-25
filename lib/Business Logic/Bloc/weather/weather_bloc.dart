import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:weather_forcast_app/Data/Repositories/weather.dart';
import 'package:weather_forcast_app/Data/Services/location.dart';

import '../../../Data/Models/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo})
      : super(WeatherState(errorMessage: '')) {
    on<FetchMyWeather>(_onFetchMyWeather);
    on<SearchWeather>(_onSearchWeather);
  }
     
  Future<FutureOr<void>> _onFetchMyWeather(
      FetchMyWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading, errorMessage: ''));
    try {
      var position = await LocationService().getCurrentLocation();
      double lat = position.latitude;
      double lon = position.longitude;

      Response response = await weatherRepo.getWeather(lat, lon);

      print("Response is ___ /n $response");
      var currentWeather = WeatherModel.fromJson(json.decode(response.body));
      emit(state.copyWith(
          status: WeatherStatus.success,
          currentWeather: currentWeather,
          errorMessage: ''));
    } catch (e) {
      print("error ---------------");
      print(e.toString());
      emit(state.copyWith(
          status: WeatherStatus.error, errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> _onSearchWeather(
      SearchWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading, errorMessage: ''));
    try {
      Response response = await weatherRepo.seachWeatherByCity(event.cityName);
      List<WeatherModel> searchResult = [];
      if (response.statusCode != 404) {
        searchResult = [WeatherModel.fromJson(json.decode(response.body))];
      } else {}
      emit(state.copyWith(
          status: WeatherStatus.success,
          searchResults: searchResult,
          errorMessage: ''));
    } catch (e) {
      print("error ---------------");
      print(e.toString());
      emit(state.copyWith(
          status: WeatherStatus.error,
          errorMessage: e.toString(),
          searchResults: []));
    }
  }
}
