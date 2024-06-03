import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gocaffeine/bloc/movie_item_detail_bloc.dart';
import 'package:gocaffeine/repositories/movie_repository.dart';
import 'package:gocaffeine/services/apis.dart';
import 'package:gocaffeine/widgets/detail/movie_detail_wrapper.dart';

class MovieDetailView extends StatelessWidget {
  MovieDetailView({
    super.key,
    required this.imdbID,
  });

  final String imdbID;

  final MoviesRepository moviesRepository =
      MoviesRepository(apiService: ApiService());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieItemDetailBloc(moviesRepository: moviesRepository)
            ..add(FetchMovieDetail(imdbID: imdbID)),
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('상세정보'),
          ),
          body: BlocBuilder<MovieItemDetailBloc, MovieItemDetailState>(
            builder: (context, state) {
              if (state is MovieItemDetailInitial) {
                return const Center(
                  child: Text('영화를 검색해주세요'),
                );
              } else if (state is MovieItemDetailInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieItemDetailLoadSuccess) {
                return MovieDetailWrapper(movie: state.movie);
              } else if (state is MovieItemDetailLoadFailure) {
                return const Text('잠시 후에 다시 시도해주세요');
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
