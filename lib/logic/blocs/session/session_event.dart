part of 'session_bloc.dart';

@immutable
sealed class SessionEvent {}

final class FetchDataRequested extends SessionEvent {
  FetchDataRequested();
}
