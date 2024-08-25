part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error,
}

extension WeatherStatusx on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;

  bool get hasError => this == WeatherStatus.error;
}

class WeatherState extends Equatable {
  WeatherState(
      {this.status = WeatherStatus.initial,
      required this.errorMessage,
      this.currentWeather,
      this.searchResults});

  final String errorMessage;
  final WeatherModel? currentWeather;
  final WeatherStatus status;
  final List<WeatherModel>? searchResults;

  @override
  List<Object?> get props => [status, errorMessage, currentWeather];

  WeatherState copyWith(
      {WeatherStatus? status,
      required String errorMessage,
      WeatherModel? currentWeather,
      List<WeatherModel>? searchResults}) {
    return WeatherState(
        status: status ?? this.status,
        errorMessage: errorMessage,
        currentWeather: currentWeather ?? this.currentWeather,
        searchResults: searchResults);
  }
}
