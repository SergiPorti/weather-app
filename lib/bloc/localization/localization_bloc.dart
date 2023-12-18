import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    LocationPermission permission;
    Position position;
    on<CheckLocalizationPermission>((event, emit) async {
      emit(LocalizationLoading());
      try {
        debugPrint('Checking LocationService');
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          return emit(LocalizationServiceEnabled());
        }
        debugPrint('Checking Permission');
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          add(RequestLocalizationPermission());
        } else if (permission == LocationPermission.deniedForever) {
          return emit(LocalizationDenied());
        }
        debugPrint('Checking getting Position');
        position = await Geolocator.getCurrentPosition();
        emit(LocalizationSuccess(position));
      } catch (e) {
        emit(LocalizationError());
      }
    });

    on<RequestLocalizationPermission>(
      (event, emit) async {
        debugPrint('Checking Requesting Permission');
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return emit(LocalizationDenied());
        }

        debugPrint('Getting Position');
        emit(LocalizationLoading());
        position = await Geolocator.getCurrentPosition();
        return emit(LocalizationSuccess(position));
      },
    );
  }
}
