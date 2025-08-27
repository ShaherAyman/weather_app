import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
        
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
              ),
              home:  HomeView(),
            );
          },
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition.contains('sunny')) {
    return Colors.orange;
  } else if (condition.contains('clear')) {
    return Colors.indigo;
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return Colors.blueGrey;
  } else if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('shower')) {
    return Colors.blue;
  } else if (condition.contains('snow') || condition.contains('blizzard')) {
    return Colors.lightBlue;
  } else if (condition.contains('thunder')) {
    return Colors.deepPurple;
  } else if (condition.contains('fog') || condition.contains('mist')) {
    return Colors.grey;
  } else if (condition.contains('sleet') || condition.contains('ice')) {
    return Colors.cyan;
  } else {
    // لون افتراضي في حالة عدم التطابق
    return Colors.teal;
  }
}
