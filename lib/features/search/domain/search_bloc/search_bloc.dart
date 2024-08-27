
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/repositories/book_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(SearchInitial()) {
    on<SearchBook>(_search);
  }

  final BookRepository _bookRepository;

  Future<void> _search(event, emit) async {
    try {
      final books = await _bookRepository.searchBooks(event.searchField);
      emit(BookFound(books: books));
    } catch (e) {
      emit(BookFindingFailure(exception: e));
    }
  }
}
