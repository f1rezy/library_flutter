import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/models/category.dart';
import 'package:library_flutter/features/main/domain/book_bloc/book_bloc.dart';
import 'package:library_flutter/features/main/domain/category_bloc/category_bloc.dart';
import 'package:library_flutter/features/main/presentation/widgets/book_tile.dart';
import 'package:library_flutter/features/main/presentation/widgets/category_tile.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Category? currentCategory;
  final PagingController<int, Book> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    context
        .read<BookBloc>()
        .add(LoadBook(page: 1, pagingController: _pagingController));
    context.read<CategoryBloc>().add(LoadCategory());
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
            child: Column(
              children: [
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoadingFailure) {
                      return Center(
                          child: Text(
                        'Ошибка',
                        style: Theme.of(context).textTheme.displayLarge,
                      ));
                    }
                    if (state is CategoryLoaded) {
                      return Container(
                        height: 43,
                        margin:
                            const EdgeInsets.only(left: 25, bottom: 15, right: 25),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) => CategoryTile(
                            category: state.categories[index],
                            isActive:
                                currentCategory == state.categories[index],
                            onTap: () {
                              if (currentCategory != state.categories[index]) {
                                context.read<BookBloc>().add(LoadBookByCategory(
                                    category: state.categories[index],
                                    pagingController: _pagingController));
                                setState(() {
                                  currentCategory = state.categories[index];
                                });
                              } else {
                                _pagingController.itemList?.clear();
                                context.read<BookBloc>().add(LoadBook(
                                    page: 1,
                                    pagingController: _pagingController));
                                setState(() {
                                  currentCategory = null;
                                });
                              }
                            },
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                Expanded(
                  child: PagedGridView(
                    pagingController: _pagingController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
