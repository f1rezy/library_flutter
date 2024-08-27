part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({
    required this.profile,
  });

  final Profile profile;

  @override
  List<Object> get props => [profile];
}

final class ProfileLoadingFailure extends ProfileState {
  const ProfileLoadingFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
