import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_Weather_State.dart';
import 'package:weather_app/models/weatherModels.dart';
import 'package:weather_app/services/WeatherServices.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  Weathermodels? weathermodels;
  getWeather({required String CityName}) async {
    try {
      weathermodels = await Weatherservices(dio: Dio())
          .getForecastWeather(CityName: CityName);
      emit(WeatherLodedState(weathermodels!));
    } catch (e) {
      emit(WeatherfailureState(
        e.toString(),
      ));
    }
  }
}
