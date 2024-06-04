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
  // 데이터 요청 중 상태 변경 -> 데이터 요창 -> 성공 상태 변경 or 실패 상태 변경
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
