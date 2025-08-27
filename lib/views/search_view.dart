


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Text('Search City',
        ),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(16),
        child:  Center(
          child:  TextField(
            // onchanged or onSubmitted 

            onSubmitted: (value) async {
             var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);// to handle cubit 
            
             getWeatherCubit.getWeather(cityname: value);
             
             Navigator.pop(context); // pop => take a step back
    
            },

            decoration: InputDecoration(

              contentPadding: const EdgeInsets.symmetric( // hieght
                horizontal: 15,
                vertical: 32
              ),

              labelText: 'Search', 

              suffixIcon: const Icon(Icons.search),    

              hintText: 'Enter city name',            
              hintStyle: const TextStyle(
                color: Colors.blueGrey
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide( // => color 
                  color: Colors.blueGrey
                )
              ),
            ),
          ),
        ),
      ),

    );
  }
}

//  WeatherModel? weatherModel;