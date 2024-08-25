part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object?> get props => [];
}

class FetchWeatherList extends WeatherEvent {
  final bool isPurchased;
  const FetchWeatherList(this.isPurchased);
  @override
  List<Object> get props => [isPurchased];
}

class FetchMyWeather extends WeatherEvent {
  const FetchMyWeather();
  @override
  List<Object> get props => [];
}

class SearchWeather extends WeatherEvent {
  final String cityName;
  const SearchWeather(this.cityName);
  @override
  List<Object> get props => [cityName];
}
