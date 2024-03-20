import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klassrum_web/data/repositories/schedule_repository.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final ScheduleRepository scheduleRepository;

  SessionBloc(this.scheduleRepository) : super(SessionInitial()) {
    on<FetchDataRequested>(_onDataFetched);
  }

  FutureOr<void> _onDataFetched(
      SessionEvent event, Emitter<SessionState> emit) async {
    emit(DataLoading());
    try {
      final scheduleList = await scheduleRepository.getSchedule();
      return emit(DataSuccess(scheduleModel: scheduleList));
    } catch (e) {
      return emit(DataFailure(e.toString()));
    }
  }
}
