part of 'movie_items_bloc.dart';

sealed class MovieItemsState extends Equatable {
  const MovieItemsState();

  @override
  List<Object> get props => [];
}

final class MovieItemsInitial extends MovieItemsState {}

final class MovieItemsLoadInProgress extends MovieItemsState {}

final class MovieItemsLoadSuccess extends MovieItemsState {
  const MovieItemsLoadSuccess({
    required this.movies,
    this.keyword = 'star',
    this.isMaxReached = false,
    this.page = 1,
    this.isLoadInProgress = false,
  });

  final MovieItemResponseModel movies;
  final String keyword;
  final bool isMaxReached;
  final int page;
  final bool isLoadInProgress;

  MovieItemsLoadSuccess copyWith({
    MovieItemResponseModel? movies,
    bool? isMaxReached,
    String? keyword,
    int? page,
    bool? isLoadInProgress,
  }) {
    return MovieItemsLoadSuccess(
      movies: movies ?? this.movies,
      isMaxReached: isMaxReached ?? this.isMaxReached,
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      isLoadInProgress: isLoadInProgress ?? this.isLoadInProgress,
    );
  }

  @override
  List<Object> get props => [
        movies,
        isMaxReached,
        keyword,
        page,
        isLoadInProgress,
      ];
}

final class MovieItemsLoadFailure extends MovieItemsState {}
