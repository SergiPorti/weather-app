import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/localization/localization_bloc.dart';
import 'package:weather_app/config/config.dart';
import 'package:weather_app/environment.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(apiKey, language: Language.SPANISH);
        Position position =
            (locator<LocalizationBloc>().state as LocalizationSuccess).position;
        Weather weather = await weatherFactory.currentWeatherByLocation(
          position.latitude,
          position.longitude,
        );
        debugPrint(weather.toString());
        final String imagePath =
            _getWeatherImageString(weather.weatherConditionCode ?? 100);

        emit(WeatherBlocSucces(weather, imagePath));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}

String _getWeatherImageString(int conditionCode) {
  final int code = conditionCode ~/ 100;
  String path = "assets/images/#.png";
  String join = "";
  switch (code) {
    case 2:
      join = "storm";
      break;
    case 3:
      join = "rainy";
      break;
    case 5:
      join = "rain";
      break;
    case 6:
      join = "snow";
      break;
    case 7:
      join = "fog";
      break;
    case 8:
      if (conditionCode > 800) {
        if (conditionCode == 801 || conditionCode == 802) {
          join = "cloudy";
        } else if (conditionCode == 804) {
          join = "cloud";
        } else {
          join = "cloudy_wind";
        }
      } else {
        join = "sun";
      }
      break;
    default:
      join = "sun";
      break;
  }
  path = path.replaceAll("#", join);
  return path;
}
