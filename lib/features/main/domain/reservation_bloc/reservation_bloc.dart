
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/main/data/models/reservation.dart';
import 'package:library_flutter/features/main/data/repositories/reservation_repository.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc({required ReservationRepository reservationRepository})
      : _reservationRepository = reservationRepository,
        super(ReservationInitial()) {
    on<MakeReservation>(_reservate);
  }

  final ReservationRepository _reservationRepository;

  Future<void> _reservate(event, emit) async {
    try {
      final reservation = await _reservationRepository.reservate(event.bookId);
      emit(ReservationSuccessful(reservation: reservation));
    } catch (e) {
      emit(ReservationFailure(exception: e));
    }
  }
}
