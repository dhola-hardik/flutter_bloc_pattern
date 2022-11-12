part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchBooksData extends HomeEvent {
  final int page;

  FetchBooksData(this.page);

  @override
  List<Object?> get props => [page];
}
