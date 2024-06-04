part of 'movie_item_detail_bloc.dart';

// initial, 데이터 요청, 데이터 요청 성공, 데이터 요청 실패 4가지 state
sealed class MovieItemDetailState extends Equatable {
  const MovieItemDetailState();

  @override
  List<Object> get props => [];
}

final class MovieItemDetailInitial extends MovieItemDetailState {}

class MovieItemDetailInProgress extends MovieItemDetailState {}

class MovieItemDetailLoadSuccess extends MovieItemDetailState {
  const MovieItemDetailLoadSuccess({
    required this.movie,
  });

  final MovieItemDetailModel movie;

  @override
  List<Object> get props => [
        movie,
      ];
}

class MovieItemDetailLoadFailure extends MovieItemDetailState {}
