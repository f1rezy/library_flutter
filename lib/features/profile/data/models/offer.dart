import 'dart:convert';

import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  const Offer({required this.id, required this.offer, required this.createdOn});

  final String id;
  final String offer;
  final DateTime createdOn;

  @override
  List<Object> get props => [id, offer, createdOn];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'offer': offer,
      'created_on': createdOn,
    };
  }

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      id: map['id'] as String,
      offer: map['offer'] as String,
      createdOn: DateTime.parse(map['created_on']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Offer.fromJson(String source) =>
      Offer.fromMap(json.decode(source) as Map<String, dynamic>);
}
