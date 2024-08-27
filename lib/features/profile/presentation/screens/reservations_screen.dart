import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter/features/main/data/models/reservation.dart';

@RoutePage()
class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key, required this.reservations});

  final List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Мои бронирования',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
          child: Column(
            children: reservations
                .map((reservation) => ReservationTile(reservation: reservation))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ReservationTile extends StatelessWidget {
  const ReservationTile({
    super.key,
    required this.reservation,
  });

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reservation.book,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            DateFormat('dd-MM-yyyy – kk:mm').format(reservation.created.add(const Duration(hours: 7))),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
