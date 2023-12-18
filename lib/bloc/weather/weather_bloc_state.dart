part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSucces extends WeatherBlocState {
  final Weather weather;
  final String imagePath;
  const WeatherBlocSucces(this.weather, this.imagePath);

  @override
  List<Object> get props => [weather];
}
