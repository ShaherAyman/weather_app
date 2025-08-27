
class WeatherModel {

  final String cityname;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
    { 
     required this.temp,
     required this.maxTemp,
     required this.minTemp,
     required this.cityname,
     required this.date,
     this.image,
     required this.weatherCondition});

  // to build constractor takes values from api through internet , we should build it using ... 

  factory WeatherModel.fromJson(json){

    return WeatherModel( 

      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityname: json['location']['name'],
      date:DateTime.parse( json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']
      );

  }

}