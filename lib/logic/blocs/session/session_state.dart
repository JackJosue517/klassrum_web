part of 'session_bloc.dart';

@immutable
sealed class SessionState {}

final class SessionInitial extends SessionState {}

final class DataSuccess extends SessionState {
  final List<ShedulerCourse> scheduleModel;

  DataSuccess({required this.scheduleModel});
}

final class DataFailure extends SessionState {
  final String error;

  DataFailure(this.error);
}

final class DataLoading extends SessionState {}
