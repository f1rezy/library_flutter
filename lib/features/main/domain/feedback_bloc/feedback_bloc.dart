import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart';
import 'package:library_flutter/features/main/data/repositories/feedback_repository.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc({required FeedbackRepository feedbackRepository})
      : _feedbackRepository = feedbackRepository,
        super(FeedbackInitial()) {
    on<LeaveFeedback>(_leave);
  }

  final FeedbackRepository _feedbackRepository;

  Future<void> _leave(event, emit) async {
    try {
      final feedback = await _feedbackRepository.leaveFeedback(event.bookId, event.text);
      emit(FeedbackLeavingSuccessful(feedback: feedback));
    } catch (e) {
      emit(FeedbackLeavingFailure(exception: e));
    }
  }
}
