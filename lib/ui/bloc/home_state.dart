part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String errorMsg;
  final int page;
  final List<BookModel> bookList;

  const HomeState({
    this.isLoading = false,
    this.errorMsg = '',
    this.page = 0,
    this.bookList = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMsg,
    int? page,
    List<BookModel>? bookList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      page: page ?? this.page,
      bookList: bookList ?? this.bookList,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMsg, page, bookList];
}
