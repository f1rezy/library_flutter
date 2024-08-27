import 'dart:convert';

import 'package:equatable/equatable.dart';

class Ownership extends Equatable {
  const Ownership({required this.id, required this.book, required this.started, required this.ended});

  final String id;
  final String book;
  final DateTime started;
  final DateTime? ended;

  @override
  List<Object> get props => [id, book, started];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'book_title': book,
      'started': started,
      'ended': ended,
    };
  }

  factory Ownership.fromMap(Map<String, dynamic> map) {
    return Ownership(
      id: map['id'] as String,
      book: map['book_title'] as String,
      started: DateTime.parse(map['started']),
      ended: map['ended'] != null ? DateTime.parse(map['ended']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ownership.fromJson(String source) =>
      Ownership.fromMap(json.decode(source) as Map<String, dynamic>);
}