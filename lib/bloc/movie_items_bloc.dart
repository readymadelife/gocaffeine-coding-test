import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gocaffeine/models/movie_item_response_model.dart';
import 'package:gocaffeine/repositories/movie_repository.dart';

part 'movie_items_event.dart';
part 'movie_items_state.dart';

class MovieItemsBloc extends Bloc<MovieItemsEvent, MovieItemsState> {
  MovieItemsBloc({required this.moviesRepository})
      : super(MovieItemsInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<SearchMovies>(_onSearchMovies);
  }

  // 영화 목록 요청 (최초 X)
  // case로 이미 loadSuccess state일때 (마지막 페이지 도달 X, 데이터 요청 중 X), 다음 페이지 영화 목록 요청 후 영화 목록 부분 업데이트

  Future<void> _onFetchMovies(
    FetchMovies event,
    Emitter<MovieItemsState> emit,
  ) async {
    final currentState = state;
    switch (currentState) {
      case MovieItemsInitial():
        emit(MovieItemsLoadInProgress());
        try {
          final movies = await moviesRepository.fetchMovies((event.keyword), 1);
          emit(MovieItemsLoadSuccess(movies: movies, keyword: event.keyword));
        } catch (_) {
          emit(MovieItemsLoadFailure());
        }
        break;
      case MovieItemsLoadInProgress():
        break;
      case MovieItemsLoadSuccess():
        if (currentState.isLoadInProgress == true ||
            currentState.isMaxReached == true) break;

        emit(MovieItemsLoadSuccess(
            movies: currentState.movies, isLoadInProgress: true));
        try {
          final movies = await moviesRepository.fetchMovies(
              currentState.keyword, currentState.page + 1);

          final updatedMovies = MovieItemResponseModel(
            search: currentState.movies.search + movies.search,
            totalResults: movies.totalResults,
            response: movies.response,
          );
          emit(currentState.copyWith(
              movies: updatedMovies,
              isLoadInProgress: false,
              page: currentState.page + 1));
        } catch (_) {
          emit(currentState.copyWith(
              isMaxReached: true, isLoadInProgress: false));
        }
        break;
      case MovieItemsLoadFailure():
        break;
    }
  }

  // 최초 영화목록 요청
  // 데이터 요청 중 상태 변경 -> 데이터 요창 -> 성공 상태 변경 or 실패 상태 변경
  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<MovieItemsState> emit,
  ) async {
    emit(MovieItemsLoadInProgress());
    try {
      final movies = await moviesRepository.fetchMovies(event.keyword, 1);
      emit(MovieItemsLoadSuccess(movies: movies, keyword: event.keyword));
    } catch (_) {
      emit(MovieItemsLoadFailure());
    }
  }

  final MoviesRepository moviesRepository;
}
