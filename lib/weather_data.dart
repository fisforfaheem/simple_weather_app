import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_weather_app/weather_model.dart';

class WeatherDate {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=82d2ce62cda64d45bc834631231408&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    print(body);
    return Weather.fromJson(body);
  }
}
