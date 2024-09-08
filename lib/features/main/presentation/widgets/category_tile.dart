import 'package:flutter/material.dart';
import 'package:library_flutter/features/main/data/models/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.isActive,
    required this.onTap,
  });

  final Category category;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.name,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
