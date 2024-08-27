import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart';
import 'package:library_flutter/features/main/data/models/reservation.dart';
import 'package:library_flutter/features/profile/data/models/offer.dart';
import 'package:library_flutter/features/profile/data/models/ownership.dart';

class Profile extends Equatable {
  const Profile({
    required this.username,
    required this.feedbacks,
    required this.reservations,
    required this.offers,
    required this.ownerships,
  });

  final String username;
  final List<Feedback> feedbacks;
  final List<Reservation> reservations;
  final List<Offer> offers;
  final List<Ownership> ownerships;

  @override
  List<Object> get props => [username, feedbacks, reservations, offers, ownerships];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'feedbacks': feedbacks,
      'reservations': reservations,
      'offers': offers,
      'ownerships': ownerships,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      username: map['username'] as String,
      feedbacks: List<Feedback>.from(
          map['feedbacks'].map((value) => Feedback.fromMap(value)).toList()),
      reservations: List<Reservation>.from(map['reservations']
          .map((value) => Reservation.fromMap(value))
          .toList()),
      offers: List<Offer>.from(
          map['offers'].map((value) => Offer.fromMap(value)).toList()),
      ownerships: List<Ownership>.from(
          map['ownerships'].map((value) => Ownership.fromMap(value)).toList()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
