import 'dart:convert';

import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  const Reservation({required this.id, required this.username, required this.created, required this.book});

  final String id;
  final String username;
  final DateTime created;
  final String book;

  @override
  List<Object> get props => [id, username, created, book];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'created': created,
      'book_title': book,
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      id: map['id'] as String,
      username: map['username'] as String,
      created: DateTime.parse(map['created']),
      book: map['book_title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reservation.fromJson(String source) => Reservation.fromMap(json.decode(source) as Map<String, dynamic>);
}