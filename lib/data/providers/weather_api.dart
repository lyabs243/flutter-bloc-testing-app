import 'package:weather/weather.dart';

import '../../constants/constants.dart';

class WeatherAPI {

  double latitude, longitude;

  WeatherAPI(this.latitude, this.longitude);

  Future<Map<String, dynamic>?> getWeather() async {
    Weather? weather;

    try {
      WeatherFactory? wf = WeatherFactory(OPEN_WEATHER_API_KEY);
      weather = await wf.currentWeatherByLocation(latitude, longitude);
    }
    catch(err) {
      print('===Error getting weather');
    }

    if (weather != null) {
      return {
        FIELD_TEMPERATURE_CELCIUS: weather.temperature!.celsius,
        FIELD_ICON: 'http://openweathermap.org/img/w/${weather.weatherIcon}.png'
      };
    }

    return null;
  }

}