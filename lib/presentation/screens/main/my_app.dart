import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/bloc/localization/localization_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc_bloc.dart';
import 'package:weather_app/config/dependency_injection/locator.dart';
import 'package:weather_app/config/router/main_go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = MainGoRouter().router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          create: (context) =>
              locator<LocalizationBloc>()..add(CheckLocalizationPermission()),
        ),
        BlocProvider<WeatherBlocBloc>(
          create: (context) => WeatherBlocBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
