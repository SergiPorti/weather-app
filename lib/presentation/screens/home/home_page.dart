import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/bloc.dart';
import 'package:weather_app/presentation/screens/utils/app_dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: BlocConsumer<LocalizationBloc, LocalizationState>(
          listener: (context, state) {
            if (state is LocalizationSuccess) {
              context.read<WeatherBlocBloc>().add(FetchWeather());
            }
          },
          builder: (context, state) {
            if (state is LocalizationLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is LocalizationSuccess) {
              return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WeatherBlocSucces) {
                    final Weather weather = state.weather;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40, 1.2 * kToolbarHeight, 40, 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(3, -0.3),
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-3, -0.3),
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, -1.2),
                                child: Container(
                                  height: 300,
                                  width: 600,
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '📍 ${weather.areaName}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: AppDimensions.xMain),
                                    const Text(
                                      'Good Morning',
                                      style: TextStyle(
                                          fontSize: AppDimensions.xLarge,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    //Todo: Cambia esta imagen segun el conditionCode
                                    Image.asset(
                                      state.imagePath,
                                    ),
                                    Center(
                                      child: Text(
                                        '${weather.temperature!.celsius!.round()}ºC',
                                        style: const TextStyle(
                                            fontSize:
                                                AppDimensions.xLarge * 2.25,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        weather.weatherMain!.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: AppDimensions.xLarge,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(height: AppDimensions.small),
                                    Center(
                                      child: Text(
                                        DateFormat('EEEE dd ·')
                                            .add_jm()
                                            .format(weather.date!),
                                        style: const TextStyle(
                                            fontSize: AppDimensions.main,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: AppDimensions.xLarge),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/11.png',
                                              scale: 8,
                                            ),
                                            const SizedBox(
                                                width: AppDimensions.small),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Amanecer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        AppDimensions.xSmall),
                                                Text(
                                                  DateFormat()
                                                      .add_jm()
                                                      .format(weather.sunrise!),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/12.png',
                                              scale: 8,
                                            ),
                                            const SizedBox(
                                                width: AppDimensions.small),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Atardecer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        AppDimensions.xSmall),
                                                Text(
                                                  DateFormat()
                                                      .add_jm()
                                                      .format(weather.sunset!),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppDimensions.xMain),
                                    const Divider(color: Colors.grey),
                                    const SizedBox(height: AppDimensions.xMain),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/13.png',
                                              scale: 8,
                                            ),
                                            const SizedBox(
                                                width: AppDimensions.small),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Amanecer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        AppDimensions.xSmall),
                                                Text(
                                                  '${weather.tempMax!.celsius!.round()}ºC',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/14.png',
                                              scale: 8,
                                            ),
                                            const SizedBox(
                                                width: AppDimensions.small),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Atardecer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        AppDimensions.xSmall),
                                                Text(
                                                  '${weather.tempMin!.celsius!.round()}ºC',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(child: Text('Weather Api Error'));
                },
              );
            }
            return const Center(child: Text('Localization Denied or Error'));
          },
        ));
  }
}
