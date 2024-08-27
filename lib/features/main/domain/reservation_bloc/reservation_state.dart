part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

final class ReservationSuccessful extends ReservationState {
  const ReservationSuccessful({
    required this.reservation,
  });

  final Reservation reservation;

  @override
  List<Object> get props => [reservation];
}

final class ReservationFailure extends ReservationState {
  const ReservationFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
