part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class LoginUser extends UserEvent {
  const LoginUser({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

final class LogoutUser extends UserEvent {}
