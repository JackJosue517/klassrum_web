import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:klassrum_web/data/models/user_model.dart';
import 'package:klassrum_web/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
  }

  FutureOr<void> _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final username = event.username;
      final password = event.password;

      if (password.length < 6) {
        return emit(AuthFailure('Mot de passe doit dépasser 06 caractères !'));
      }

      final user = await authRepository.getAppUser(username, password);
      return emit(AuthSuccess(userModel: user));
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
