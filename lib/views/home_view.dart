import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_Weather_State.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weathermodels
            ?.weatherCondition),
        title: const Text('Weather App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }));
                },
                icon: const Icon(Icons.search)),
          )
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, State) {
        if (State is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (State is WeatherLodedState) {
          return WeatherInfoBody(
            weather: State.weathermodels,
          );
        } else {
          return const Text('Oops NO Value Try Again');
        }
      }),
    );
  }
}
