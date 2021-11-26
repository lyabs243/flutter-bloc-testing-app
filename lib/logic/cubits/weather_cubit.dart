import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/constants/enums.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../constants/utils.dart';

class WeatherCubit extends Cubit<WeatherState> {

  BuildContext context;

  WeatherCubit(this.context) : super(WeatherState(customState: CustomState.loading)) {
    getWeather();
  }

  getWeather() async {
    emit(WeatherState(customState: CustomState.loading));

    String? city = await _getCity();
    if (city == null) {
      emit(WeatherState(customState: CustomState.error));
    }
    else {
      WeatherState weatherState = WeatherState(customState: CustomState.done);
      weatherState.city = city;
      emit(weatherState);
    }
  }

  Future<String?> _getCity() async {
    String? city;
    try {
      Position position = await getCurrentLocation(context);
      List<Placemark>? placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.length > 0) {
        city = placemarks.first.locality;
      }
    }
    catch(e) {
      print('===Error get Placemarks: $e');
    }

    return city;
  }

}