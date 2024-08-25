class WeatherModel {
  final String id;
  final String name;
  final String tempMax;
  final String tempMin;
  final String temp;
  final String description;
  final String feels;
  final String pressure;
  final String humidity;
  final String? seaLevel;
  final String? grndLevel;
  final String visibility;
  final String windSpeed;
  final String? windGust;
  final String windDeg;
  final String clouds;
  final String country;
  final int sunRise;
  final int sunSet;
  final int timezone;
  final String icon;

  WeatherModel(
      {required this.id,
      required this.name,
      required this.tempMax,
      required this.tempMin,
      required this.temp,
      required this.description,
      required this.feels,
      required this.pressure,
      required this.humidity,
      this.seaLevel,
      this.grndLevel,
      required this.visibility,
      required this.windSpeed,
      this.windGust,
      required this.windDeg,
      required this.clouds,
      required this.country,
      required this.sunRise,
      required this.sunSet,
      required this.timezone,
      required this.icon});

  // Create Weather object from JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        id: json['id'].toString(),
        name: json['name'],
        tempMax: json['main']['temp_max'].toString(),
        tempMin: json['main']['temp_min'].toString(),
        temp: json['main']['temp'].toString(),
        description: json['weather'][0]['description'],
        feels: json['main']['feels_like'].toString(),
        pressure: json['main']['pressure'].toString(),
        humidity: json['main']['humidity'].toString(),
        seaLevel: json['main']['sea_level']?.toString(),
        grndLevel: json['main']['grnd_level']?.toString(),
        visibility: json['visibility'].toString(),
        windSpeed: json['wind']['speed'].toString(),
        windGust: json['wind']['gust']?.toString(),
        windDeg: json['wind']['deg'].toString(),
        clouds: json['clouds']['all'].toString(),
        country: json['sys']['country'],
        sunRise: json['sys']['sunrise'],
        sunSet: json['sys']['sunset'],
        timezone: json['timezone'],
        icon: json['weather'][0]['icon']);
  }
}
