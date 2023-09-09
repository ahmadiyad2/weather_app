import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/weather_services.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class SarchePage extends StatelessWidget {
  SarchePage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: TextField(
            onChanged:(data) {
               cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context , listen: false ).weatherData = weather;
              Provider.of<WeatherProvider>(context , listen: false ).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context , listen: false ).weatherData = weather;
              Provider.of<WeatherProvider>(context , listen: false ).cityName = cityName;
              Navigator.pop(context);
                   
                },
              ),
              labelText: 'User Name',
              hintText: 'Enter Your Name',
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weather;
