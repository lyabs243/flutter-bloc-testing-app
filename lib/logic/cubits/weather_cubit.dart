import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/data/models/weather_item.dart';
import 'package:flutter_structure/data/repositories/weather_repository.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../utils/methods.dart';

class WeatherCubit extends Cubit<WeatherState> {

  BuildContext context;

  WeatherCubit(this.context) : super(WeatherState(customState: CustomState.loading)) {
    getWeather();
  }

  getWeather() async {
    emit(WeatherState(customState: CustomState.loading));

    String? city;
    Position? position;

    try {
      position = await getCurrentLocation(context);
      city = await _getCity(position);
    }
    catch(e) {
      debugPrint('===Error get weather from cubit: $e');
    }

    if (city == null) {
      emit(WeatherState(customState: CustomState.error));
    }
    else {

      WeatherRepository weatherRepository = WeatherRepository(city, position!.latitude, position.longitude);
      WeatherItem? weatherItem = await weatherRepository.getFromLocation();

      if (weatherItem == null) {
        emit(WeatherState(customState: CustomState.error));
      }
      else {
        WeatherState weatherState = WeatherState(customState: CustomState.done);
        weatherState.weatherItem = weatherItem;
        emit(weatherState);
      }
    }
  }

  Future<String?> _getCity(Position position) async {
    String? city;
    try {
      List<Placemark>? placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        city = placemarks.first.locality;
      }
    }
    catch(e) {
      debugPrint('===Error get Placemarks: $e');
    }

    return city;
  }

}