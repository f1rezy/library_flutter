part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

final class MakeReservation extends ReservationEvent {
  const MakeReservation({required this.bookId});

  final String bookId;

  @override
  List<Object> get props => [bookId];
}
