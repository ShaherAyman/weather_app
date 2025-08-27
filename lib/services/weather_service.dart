
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';


class WeatherService {

    final Dio dio  ;
    final String baseUrl = 'http://api.weatherapi.com/v1';
    final String apiKey = 'cc6cfc5e315b4842a2a143320253006';

  WeatherService(this.dio); 
  
  Future<WeatherModel> getCurrentWeather({ required String cityName}) async {

   try {

  Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1'); 
  // response => api
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);

   return weatherModel;// object has all data that you want it 
}

  on DioException catch (e) {
    final String errorMessage = e.response?.data['error']['message'] ?? 'oops threre was an erorr try later ';
                                        // ? => if response is not null 
    throw Exception(errorMessage);
}
catch(e){

    log(e.toString());
    throw Exception('oops threre was an erorr try later');

}

  }
}

