part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class CheckLocalizationPermission extends LocalizationEvent {}
class RequestLocalizationPermission extends LocalizationEvent {}
