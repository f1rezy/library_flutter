import 'package:dio/dio.dart';
import 'package:library_flutter/features/main/data/models/reservation.dart';

class ReservationRepository {
  ReservationRepository({required this.dio});

  final Dio dio;

  Future<Reservation> reservate(String book) async {
    final response = await dio.post('/reservations/', data: {'book': book});
    final data = response.data as Map<String, dynamic>;
    final reservation = Reservation.fromMap(data);
    return reservation;
  }
}
