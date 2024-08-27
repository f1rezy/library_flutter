import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/domain/book_bloc/book_bloc.dart';
import 'package:library_flutter/features/main/presentation/widgets/book_tile.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PagingController<int, Book> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    context
        .read<BookBloc>()
        .add(LoadBook(page: 1, pagingController: _pagingController));
    _pagingController.addPageRequestListener((pageKey) {
      context
          .read<BookBloc>()
          .add(LoadBook(page: pageKey, pagingController: _pagingController));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoadingFailure) {
          return Center(
              child: Text(
            'Ошибка',
            style: Theme.of(context).textTheme.displayLarge,
          ));
        }
        if (state is BookLoaded) {
          return Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: PagedGridView(
              pagingController: _pagingController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15,
                childAspectRatio: 9 / 16,
                crossAxisCount: 2,
              ),
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              builderDelegate: PagedChildBuilderDelegate<Book>(
                itemBuilder: (context, item, index) => BookTile(
                  book: item,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
