import 'package:dio/dio.dart';
import 'package:library_flutter/features/profile/data/models/offer.dart';

class OfferRepository {
  OfferRepository({required this.dio});

  final Dio dio;

  Future<Offer> offer(String text) async {
    final response = await dio.post(
      '/offers/',
      data: {
        'offer': text,
      },
    );
    final offer = Offer.fromMap(response.data);
    return offer;
  }
}