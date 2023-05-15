part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class FetchBooks extends HomeEvent {
  final String? searchText;

  FetchBooks({this.searchText});

  @override
  List<Object?> get props => [searchText];
}

class FetchMoreBooks extends HomeEvent {
  final String? searchText;

  FetchMoreBooks({this.searchText});

  @override
  List<Object?> get props => [searchText];
}
