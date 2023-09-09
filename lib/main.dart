import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/providers/weather_provider.dart';

void main() {
  runApp(WeatherApp());
  
}

class WeatherApp extends StatelessWidget {
  
   WeatherModel? weatherModel  ;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {

        return WeatherProvider() ;
      } ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green
        ),
        home: HomePage(),
      ),
    );
  }
}
