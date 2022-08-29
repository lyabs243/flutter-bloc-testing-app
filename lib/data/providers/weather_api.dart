import 'package:flutter_structure/data/models/weather_item.dart';
import 'package:flutter_structure/utils/my_material.dart';
import 'package:weather/weather.dart';

class WeatherAPI {

  double latitude, longitude;

  WeatherAPI(this.latitude, this.longitude);

  Future<Map<String, dynamic>?> getWeather() async {
    Weather? weather;

    try {
      WeatherFactory? wf = WeatherFactory(openWeatherAPIKey);
      weather = await wf.currentWeatherByLocation(latitude, longitude);
    }
    catch(err) {
      debugPrint('===Error getting weather');
    }

    if (weather != null) {
      return {
        fieldTemperatureCelcius: weather.temperature!.celsius,
        fieldIcon: 'http://openweathermap.org/img/w/${weather.weatherIcon}.png'
      };
    }

    return null;
  }

}