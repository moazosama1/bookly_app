import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/BookModel.dart';
import '../../data/repo/search_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit({required this.searchRepo}) : super(SearchBooksInitial());
  SearchRepo searchRepo;
  List<BookModel> listBooks = [];
  searchBooks({required String query}) async {
    emit(SearchBooksInitial());
    emit(SearchBooksLoading());
    var result =
        await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(SearchBooksSuccess(listBooks: books));
        listBooks = books;
      },
    );
  }
}
