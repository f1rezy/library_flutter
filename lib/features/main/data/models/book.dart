import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/main/data/models/category.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart';
import 'package:library_flutter/features/main/data/models/reservation.dart';

class Book extends Equatable {
  const Book(
      {required this.id,
      required this.title,
      required this.description,
      required this.author,
      required this.category,
      required this.image,
      required this.feedbacks,
      required this.reservations});

  final String id;
  final String title;
  final String description;
  final String author;
  final Category category;
  final String image;
  final List<Feedback> feedbacks;
  final List<Reservation> reservations;

  @override
  List<Object> get props =>
      [id, title, description, author, image, feedbacks, reservations];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'category': category,
      'image': image,
      'feedbacks': feedbacks,
      'reservations': reservations,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      author: map['author'] as String,
      category: Category.fromMap(map['category']),
      image: map['image']['image'] as String,
      feedbacks: List<Feedback>.from(
          map['feedbacks'].map((value) => Feedback.fromMap(value)).toList()),
      reservations: List<Reservation>.from(map['reservations']
          .map((value) => Reservation.fromMap(value))
          .toList()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
