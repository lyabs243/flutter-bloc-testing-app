import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_structure/data/models/weather_item.dart';
import 'package:flutter_structure/data/providers/weather_api.dart';

class WeatherRepository {

  late WeatherAPI weatherAPI;
  final double latitude, longitude;
  final String city;

  WeatherRepository(this.city, this.latitude, this.longitude) {
    weatherAPI = WeatherAPI(latitude, longitude);
  }

  Future<WeatherItem?> getFromLocation() async {
    WeatherItem? weatherItem;
    Map<String, dynamic>? rowData = await weatherAPI.getWeather();

    if (rowData != null) {
      double temperature = rowData[FIELD_TEMPERATURE_CELCIUS];
      String iconUrl = rowData[FIELD_ICON];
      weatherItem = WeatherItem(city, iconUrl, temperature);
    }

    return weatherItem;
  }

}