part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool? isLoading;
  final int? page;
  final BookResponseModel? response;

  const HomeState({
    this.isLoading = false,
    this.page = 0,
    this.response,
  });

  HomeState copyWith({
    bool? isLoading,
    int? page,
    BookResponseModel? response,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [isLoading, page];
}
