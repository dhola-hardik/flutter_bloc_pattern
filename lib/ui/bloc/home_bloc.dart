import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/models/book_response_model.dart';
import '../../infra/repository/book_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookRepository repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<FetchBooks>(_onFetchBooks);
    on<FetchMoreBooks>(_onFetchMoreBooks);
  }

  FutureOr<void> _onFetchBooks(FetchBooks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, page: 0, errorMsg: '', bookList: []));
    final result = await repo.getBooks(page: state.page, search: event.searchText);
    if (result.isSuccess) {
      emit(state.copyWith(
        isLoading: false,
        page: state.page + 1,
        bookList: result.items,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: result.message,
      ));
    }
  }

  FutureOr<void> _onFetchMoreBooks(FetchMoreBooks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, errorMsg: ''));
    final result = await repo.getBooks(page: state.page, search: event.searchText);
    if (result.isSuccess) {
      List<BookModel> list = result.items ?? [];
      list.insertAll(0, state.bookList);
      emit(state.copyWith(
        isLoading: false,
        page: state.page + 1,
        bookList: list,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: result.message,
      ));
    }
  }
}
