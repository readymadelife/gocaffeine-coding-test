part of 'movie_item_detail_bloc.dart';

sealed class MovieItemDetailEvent extends Equatable {
  const MovieItemDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetail extends MovieItemDetailEvent {
  const FetchMovieDetail({
    required this.imdbID,
  });
  final String imdbID;

  @override
  List<Object> get props => [imdbID];
}
