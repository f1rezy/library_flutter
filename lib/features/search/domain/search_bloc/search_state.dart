part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class BookFound extends SearchState {
  const BookFound({
    required this.books,
  });

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

final class BookFindingFailure extends SearchState {
  const BookFindingFailure({
    required this.exception,
  });

  final Object exception;

  @override
  List<Object> get props => [exception];
}
