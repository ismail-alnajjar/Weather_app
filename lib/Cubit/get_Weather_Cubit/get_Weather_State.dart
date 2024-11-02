import 'package:weather_app/models/weatherModels.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  final Weathermodels weathermodels;

  WeatherLodedState(this.weathermodels);
}

class WeatherfailureState extends WeatherState {
  final String errMessage;

  WeatherfailureState(this.errMessage);
}
