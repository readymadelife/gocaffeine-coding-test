part of 'movie_item_detail_bloc.dart';

// 데이터 fetch 이벤트
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
