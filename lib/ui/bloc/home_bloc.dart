import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../infra/model/book_response_model.dart';
import '../../infra/repository/book_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookRepository repo;

  HomeBloc(this.repo) : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
  }

  FutureOr<void> fetchBooksData(FetchBooksData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await repo.getBooks(page: event.page);
    emit(state.copyWith(isLoading: false, response: result));
  }
}
