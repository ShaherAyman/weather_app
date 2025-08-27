

class WeatherState{}


class WeatherInitialState extends WeatherState{
}

class WeatherLoadedState extends WeatherState{
}

class WeatherSucceslState extends WeatherState{}


class WeatherFailerState extends WeatherState {
    final String erorMessage;

  WeatherFailerState({required this.erorMessage});
}
