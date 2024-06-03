part of 'movie_items_bloc.dart';

sealed class MovieItemsEvent extends Equatable {
  const MovieItemsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovies extends MovieItemsEvent {
  const FetchMovies(this.keyword);
  final String keyword;

  @override
  List<Object> get props => [keyword];
}

class SearchMovies extends MovieItemsEvent {
  const SearchMovies({
    required this.keyword,
  });
  final String keyword;

  @override
  List<Object> get props => [keyword];
}
