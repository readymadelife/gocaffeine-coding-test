part of 'movie_item_detail_bloc.dart';

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
