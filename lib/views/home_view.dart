import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gocaffeine/bloc/movie_items_bloc.dart';
import 'package:gocaffeine/repositories/movie_repository.dart';
import 'package:gocaffeine/services/apis.dart';
import 'package:gocaffeine/widgets/home/movie_item_container.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final MoviesRepository moviesRepository =
      MoviesRepository(apiService: ApiService());

  @override
  Widget build(BuildContext context) {
    // 최초 star keyword 영화 목록 검색
    return BlocProvider(
      create: (context) => MovieItemsBloc(moviesRepository: moviesRepository)
        ..add(const SearchMovies(keyword: 'star')),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '고무비',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: const MovieItemContainer(),
      ),
    );
  }
}
