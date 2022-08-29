const fieldTemperatureCelcius = 'temperature_celcius';
const fieldCity = 'city';
const fieldIcon = 'icon';

class WeatherItem {

  String city, icon;
  double temperatureCelcius;

  WeatherItem(this.city, this.icon, this.temperatureCelcius);

  static WeatherItem? fromMap(Map map) {
    WeatherItem? weather;

    if (map[fieldTemperatureCelcius] != null && map[fieldIcon] != null) {
      weather = WeatherItem('', map[fieldIcon], map[fieldTemperatureCelcius]);
    }

    return weather;
  }
}