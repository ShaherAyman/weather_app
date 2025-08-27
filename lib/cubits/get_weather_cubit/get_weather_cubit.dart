import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {

  GetWeatherCubit() : super(WeatherInitialState()); // defult state

  WeatherModel? weatherModel;

  getWeather({required String cityname}) async {

     //WeatherSucceslState
    try {
      emit(WeatherLoadedState());
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityname);

      emit(WeatherSucceslState());
      
    } catch (e) {
      emit(WeatherFailerState(erorMessage: e.toString()));
    }
  
  }
}
