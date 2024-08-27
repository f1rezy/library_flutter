import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_flutter/core/navigation/navigation.gr.dart';
import 'package:library_flutter/features/main/data/models/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(BookRoute(book: book));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: book.image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              // width: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              strutStyle: const StrutStyle(fontSize: 12.0),
              text: TextSpan(
                style: Theme.of(context).textTheme.labelLarge,
                text: book.title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
