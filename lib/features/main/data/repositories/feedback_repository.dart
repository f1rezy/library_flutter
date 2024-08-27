import 'package:dio/dio.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart';

class FeedbackRepository {
  FeedbackRepository({required this.dio});

  final Dio dio;

  Future<Feedback> leaveFeedback(String book, String text) async {
    final response = await dio.post(
      '/feedbacks/',
      data: {
        'book': book,
        'text': text,
      },
    );
    final data = response.data as Map<String, dynamic>;
    final feedback = Feedback.fromMap(data);
    return feedback;
  }
}
