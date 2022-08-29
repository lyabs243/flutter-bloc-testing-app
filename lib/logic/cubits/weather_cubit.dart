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

  WeatherCubit(this.context) : super(WeatherState()) {
    getWeather();
  }

  getWeather() async {
    state.isLoading = true;
    emit(state.copy());

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
      state.isLoading = false;
    }
    else {

      WeatherRepository weatherRepository = WeatherRepository(city, position!.latitude, position.longitude);
      WeatherItem? weatherItem = await weatherRepository.getFromLocation();

      state.isLoading = false;
      state.weatherItem = weatherItem;
    }

    emit(state.copy());
  }

  Future<String?> _getCity(Position position) async {
    String? city;
    try {
      List<Placemark>? placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placeMarks.isNotEmpty) {
        city = placeMarks.first.locality;
      }
    }
    catch(e) {
      debugPrint('===Error get Placemarks: $e');
    }

    return city;
  }

}