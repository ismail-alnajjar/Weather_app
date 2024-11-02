import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weatherModels.dart';

class Weatherservices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = '068235a1674c4e65bff161733242308';
  Weatherservices({required this.dio});

  Future<Weathermodels> getForecastWeather({required String CityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$CityName&days=1');
      Weathermodels weathermodels = Weathermodels.fromJson(response.data);
      return weathermodels;
    } on DioException catch (e) {
      final String errMessag =
          e.response?.data['error']['message'] ?? 'Oops Try Again';
      throw Exception(errMessag);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops hhhhhhh');
    }
  }
}
