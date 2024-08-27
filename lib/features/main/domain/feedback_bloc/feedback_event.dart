part of 'feedback_bloc.dart';

sealed class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object> get props => [];
}

final class LeaveFeedback extends FeedbackEvent {
  const LeaveFeedback({required this.bookId, required this.text});

  final String bookId;
  final String text;

  @override
  List<Object> get props => [bookId, text];
}
