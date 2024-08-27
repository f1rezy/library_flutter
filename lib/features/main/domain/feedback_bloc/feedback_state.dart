part of 'feedback_bloc.dart';

sealed class FeedbackState extends Equatable {
  const FeedbackState();
  
  @override
  List<Object> get props => [];
}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackLeavingSuccessful extends FeedbackState {
  const FeedbackLeavingSuccessful({
    required this.feedback,
  });

  final Feedback feedback;

  @override
  List<Object> get props => [feedback];
}

final class FeedbackLeavingFailure extends FeedbackState {
  const FeedbackLeavingFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
