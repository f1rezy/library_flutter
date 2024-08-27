import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart' as models;
import 'package:library_flutter/features/main/domain/feedback_bloc/feedback_bloc.dart';
import 'package:library_flutter/features/main/presentation/widgets/feedback_input.dart';
import 'package:toastification/toastification.dart';

class FeedbackBottomSheet extends StatefulWidget {
  const FeedbackBottomSheet({
    super.key,
    required this.book,
    required this.onClose,
  });

  final Book book;
  final Function(models.Feedback) onClose;

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedbackBloc, FeedbackState>(
      listener: (context, state) {
        if (state is FeedbackLeavingSuccessful) {
          toastification.show(
            title: const Text('Успешно!'),
            type: ToastificationType.success,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.topCenter,
          );
          widget.onClose(state.feedback);
          Navigator.pop(context);
        }
        if (state is FeedbackLeavingFailure) {
          toastification.show(
            title: const Text('Ошибка'),
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.topCenter,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FeedbackInput(
              controller: _controller,
            ),
            GestureDetector(
              onTap: () {
                context.read<FeedbackBloc>().add(LeaveFeedback(
                    bookId: widget.book.id, text: _controller.text));
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Оставить отзыв',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
