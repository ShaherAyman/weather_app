import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Weather App',
        style: TextStyle(
           fontWeight: FontWeight.bold
        ),
        ),
        actions: [

          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const SearchView();
              }));
            },
             icon: const Icon(Icons.search),
             )
        ],

      ),

      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        
        builder: (context,state){

          // state ==> emit 

       if(state is WeatherInitialState ){
        return const NoWeatherBody();
       }
       
       else if (state is WeatherLoadedState)
       {
        return Center(child: CircularProgressIndicator()); 
        
        // WeatherInfoBody();

         
       }
       else if(state is WeatherSucceslState ){
        return WeatherInfoBody();
       } 
        else 
        {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red
                ,
                borderRadius: BorderRadius.circular(16)
              ),
              padding: EdgeInsets.all(24),
              
              height: 100,
              width: 300,
              child: Center(child: const Text("opps ... there was an error, please try later",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              
              ),
              )),
            ),
          );
        }
      })
    );
  }
}

// create state  done
// create cubit 
// create function 
// provide cubit 
// integrate cubit 
// trigger 
