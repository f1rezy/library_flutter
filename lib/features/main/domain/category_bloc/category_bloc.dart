import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/main/data/models/category.dart';
import 'package:library_flutter/features/main/data/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<LoadCategory>(_load);
  }

  final CategoryRepository _categoryRepository;

  Future<void> _load(event, emit) async {
    try {
      if (state is! CategoryLoaded) {
        emit(CategoryLoading());
      }
      final categories = await _categoryRepository.getCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryLoadingFailure(exception: e));
    }
  }
}
