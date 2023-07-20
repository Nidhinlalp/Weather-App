import 'dart:convert';
import 'package:http/http.dart' as http;

const String openWeatherAPIKey = '915a0d0d92fa15b0743cb8e511787b89';

class WeatherRepo {
  Future<Map<String, dynamic>> getCurrentWeather(String qurey) async {
    try {
      String cityName = qurey;
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
