import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_Weather_State.dart';
import 'package:weather_app/Cubit/get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weathermodels
                          ?.weatherCondition),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.amber; // درجات لون مشمس
    case 'clear':
      return Colors.blueGrey; // درجات لون صافٍ
    case 'partly cloudy':
      return Colors.cyan; // درجات لون غائم جزئيًا
    case 'cloudy':
      return Colors.grey; // درجات لون غائم
    case 'overcast':
      return Colors.blueGrey; // درجات لون غائم كليًا
    case 'mist':
      return Colors.blueGrey; // درجات لون شبورة
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue; // درجات لون احتمالية حدوث مطر، ثلج، أو برد متقطع
    case 'thundery outbreaks possible':
      return Colors.deepPurple; // درجات لون احتمالية حدوث عواصف رعدية
    case 'blowing snow':
      return Colors.lightBlue; // درجات لون تساقط ثلوج مع رياح قوية
    case 'blizzard':
      return Colors.blue; // درجات لون عاصفة ثلجية
    case 'fog':
      return Colors.blueGrey; // درجات لون الضباب
    case 'freezing fog':
      return Colors.blueGrey; // درجات لون الضباب الجليدي
    case 'patchy light drizzle':
    case 'light drizzle':
      return Colors.lightBlue; // درجات لون الرذاذ الخفيف
    case 'freezing drizzle':
      return Colors.cyan; // درجات لون الرذاذ الجليدي
    case 'heavy freezing drizzle':
      return Colors.cyan; // درجات لون الرذاذ الجليدي الكثيف
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
      return Colors.indigo; // درجات لون الأمطار الخفيفة إلى الغزيرة
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.cyan; // درجات لون البرد الخفيف إلى المعتدل
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.lightBlue; // درجات لون الثلوج الخفيفة إلى الغزيرة
    case 'ice pellets':
      return Colors.cyan; // درجات لون حبيبات الجليد
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.blue; // درجات لون زخات المطر الخفيفة إلى الغزيرة
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.cyan; // درجات لون زخات البرد الخفيفة إلى المعتدلة
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue; // درجات لون زخات الثلوج الخفيفة إلى المعتدلة
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors
          .deepPurple; // درجات لون الأمطار أو الثلوج المصحوبة بالعواصف الرعدية
    case 'hail':
      return Colors.cyan; // درجات لون البَرَد
    case 'windy':
    case 'breezy':
      return Colors.teal; // درجات لون الرياح
    default:
      return Colors.blueGrey; // اللون الافتراضي للحالات غير المعروفة
  }
}
