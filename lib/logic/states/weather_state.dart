import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/data/models/weather_item.dart';

class WeatherState {

  bool isLoading;
  WeatherItem? weatherItem;

  WeatherState({this.isLoading = true, this.weatherItem});

  WeatherState copy() {
    WeatherState copy = WeatherState(isLoading: isLoading, weatherItem: weatherItem);

    return copy;
  }

}