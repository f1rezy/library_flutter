part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

final class LoadBook extends BookEvent {
  const LoadBook({required this.page, required this.pagingController});

  final int page;
  final PagingController pagingController;

  @override
  List<Object> get props => [page, pagingController];
}

final class LoadBookByCategory extends BookEvent {
  const LoadBookByCategory({required this.category, required this.pagingController});

  final Category category;
  final PagingController pagingController;

  @override
  List<Object> get props => [category, pagingController];
}
