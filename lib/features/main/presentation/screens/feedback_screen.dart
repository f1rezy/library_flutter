import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/models/feedback.dart'
    as models;
import 'package:library_flutter/features/main/presentation/widgets/feedback_bottom_sheet.dart';

@RoutePage()
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key, required this.book});

  final Book book;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Отзывы',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 90),
                child: Column(
                  children: widget.book.feedbacks
                      .map((feedback) => FeedbackTile(feedback: feedback))
                      .toList(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 25,
            right: 25,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (BuildContext context) {
                    return FeedbackBottomSheet(
                      book: widget.book,
                      onClose: (feedback) => setState(() {
                        widget.book.feedbacks.add(feedback);
                      }),
                    );
                  },
                );
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
          )
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  const FeedbackTile({
    super.key,
    required this.feedback,
  });

  final models.Feedback feedback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            feedback.username,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            feedback.text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
