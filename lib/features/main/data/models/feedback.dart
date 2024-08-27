import 'dart:convert';

import 'package:equatable/equatable.dart';

class Feedback extends Equatable {
  const Feedback({required this.id, required this.username, required this.text, required this.createdOn, required this.book});

  final String id;
  final String username;
  final String text;
  final DateTime createdOn;
  final String book;

  @override
  List<Object> get props => [id, username, text, createdOn, book];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'text': text,
      'created_on': createdOn,
      'book': book,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['id'] as String,
      username: map['username'] as String,
      text: map['text'] as String,
      createdOn: DateTime.parse(map['created_on']),
      book: map['book'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feedback.fromJson(String source) => Feedback.fromMap(json.decode(source) as Map<String, dynamic>);
}