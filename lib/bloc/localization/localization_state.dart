part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationLoading extends LocalizationState {}

final class LocalizationDenied extends LocalizationState {}

final class LocalizationSuccess extends LocalizationState {
  final Position position;
  const LocalizationSuccess(this.position);

  @override
  List<Object> get props => [position];
}

final class LocalizationError extends LocalizationState {}

final class LocalizationServiceEnabled extends LocalizationState {}
