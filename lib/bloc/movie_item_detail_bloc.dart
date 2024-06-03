import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gocaffeine/models/movie_item_detail_model.dart';
import 'package:gocaffeine/repositories/movie_repository.dart';

part 'movie_item_detail_event.dart';
part 'movie_item_detail_state.dart';

class MovieItemDetailBloc
    extends Bloc<MovieItemDetailEvent, MovieItemDetailState> {
  MovieItemDetailBloc({required this.moviesRepository})
      : super(MovieItemDetailInitial()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
  }

  final MoviesRepository moviesRepository;

  Future<void> _onFetchMovieDetail(
      FetchMovieDetail event, Emitter<MovieItemDetailState> emit) async {
    emit(MovieItemDetailInProgress());
    try {
      final movie = await moviesRepository.fetchMovieDetail(event.imdbID);
      emit(MovieItemDetailLoadSuccess(movie: movie));
    } catch (_) {
      emit(MovieItemDetailLoadFailure());
    }
  }
}
