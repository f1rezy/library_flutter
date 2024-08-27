import 'package:flutter/material.dart';

class FeedbackInput extends StatelessWidget {
  const FeedbackInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).primaryColor),
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.multiline,
        minLines: 5,
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Оставьте отзыв',
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}