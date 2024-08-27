import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(BookInitial()) {
    on<LoadBook>(_load);
  }

  final BookRepository _bookRepository;

  Future<void> _load(event, emit) async {
    try {
      if (state is! BookLoaded) {
        emit(BookLoading());
      }
      final books = await _bookRepository.getBooks(event.page);
      emit(BookLoaded(books: books));
      final isLastPage = books.length < 10;
      if (isLastPage) {
        event.pagingController.appendLastPage(books);
      } else {
        final nextPageKey = event.page + 1;
        event.pagingController.appendPage(books, nextPageKey as int);
      }
    } catch (e) {
      event.pagingController.error = e;
      emit(BookLoadingFailure(exception: e));
    }
  }
}
