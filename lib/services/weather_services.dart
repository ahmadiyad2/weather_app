import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
      WeatherModel? model  ;
      try{
        String baseUrl = 'http://api.weatherapi.com/v1';
    String ApiKey = 'bf3d11ec98b8496d841193915232506';

    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$ApiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

     model = WeatherModel.fromJson(data);
      }catch(e){
        print('error');
      }

    return model;
  }
}
