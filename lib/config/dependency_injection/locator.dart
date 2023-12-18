import 'package:get_it/get_it.dart';
import 'package:weather_app/bloc/localization/localization_bloc.dart';
import 'package:weather_app/config/config.dart'
    show NavigationHandler, MainNavigationHandler;

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<NavigationHandler>(() => MainNavigationHandler());

    locator.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
}
