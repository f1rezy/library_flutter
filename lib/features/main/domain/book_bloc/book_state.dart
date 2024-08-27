part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookLoaded extends BookState {
  const BookLoaded({
    required this.books,
  });

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

final class BookLoadingFailure extends BookState {
  const BookLoadingFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
