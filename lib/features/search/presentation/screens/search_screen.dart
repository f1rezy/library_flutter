import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/main/presentation/widgets/book_tile.dart';
import 'package:library_flutter/features/search/domain/search_bloc/search_bloc.dart';
import 'package:library_flutter/features/search/presentation/widgets/search_input.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SearchInput(onChanged: (String value) {
            context.read<SearchBloc>().add(SearchBook(searchField: value));
          }),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is BookFound) {
                if (state.books.isEmpty) {
                  return Expanded(
                    child: Center(
                        child: Text(
                      'Книги не найдены',
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                  );
                }
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height - 141,
                  child: GridView.count(
                      primary: false,
                      crossAxisSpacing: 15,
                      childAspectRatio: 9 / 16,
                      crossAxisCount: 2,
                      children: state.books
                          .map((book) => BookTile(book: book))
                          .toList()),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
