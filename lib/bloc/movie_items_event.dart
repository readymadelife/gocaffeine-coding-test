part of 'movie_items_bloc.dart';

sealed class MovieItemsEvent extends Equatable {
  const MovieItemsEvent();

  @override
  List<Object> get props => [];
}

// 데이터 요청 event (최초 X)
class FetchMovies extends MovieItemsEvent {
  const FetchMovies(this.keyword);
  final String keyword;

  @override
  List<Object> get props => [keyword];
}

// 최초 영화 목록 요청 event
class SearchMovies extends MovieItemsEvent {
  const SearchMovies({
    required this.keyword,
  });
  final String keyword;

  @override
  List<Object> get props => [keyword];
}
