part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchBook extends SearchEvent {
  const SearchBook({required this.searchField});

  final String searchField;

  @override
  List<Object> get props => [searchField];
}
