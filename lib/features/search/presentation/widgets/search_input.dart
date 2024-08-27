import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).primaryColor),
        textAlignVertical: TextAlignVertical.center,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Поиск',
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
