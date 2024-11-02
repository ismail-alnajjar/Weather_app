import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weathermodels
            ?.weatherCondition),
        title: const Text('Search  City'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(CityName: value);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            suffixIcon: Icon(Icons.search),
            label: Text('Search'),
            hintText: 'Enter City Name',
            hintStyle: TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
        ),
      ),
    );
  }
}
