import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/auth/data/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial()) {
    on<LoginUser>(_login);
    on<LogoutUser>(_logout);
  }

  final UserRepository _userRepository;

  Future<void> _login(event, emit) async {
    try {
      await _userRepository.login(event.username, event.password);
      emit(UserAuthenticated());
    } catch (e) {
      emit(UserAuthentificationError());
    }
  }

  Future<void> _logout(event, emit) async {
    emit(UserUnauthenticated());
  }
}
