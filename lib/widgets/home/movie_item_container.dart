import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gocaffeine/bloc/movie_items_bloc.dart';
import 'package:gocaffeine/models/movie_item_model.dart';
import 'package:gocaffeine/widgets/home/home_search_bar.dart';
import 'package:gocaffeine/widgets/home/movie_item_wrapper.dart';

// 영화 목록 list 관리
// 무한 스크롤 적용
class MovieItemContainer extends StatefulWidget {
  const MovieItemContainer({
    super.key,
  });

  @override
  State<MovieItemContainer> createState() => _MovieITemContainerState();
}

class _MovieITemContainerState extends State<MovieItemContainer> {
  final ScrollController _scrollController = ScrollController();

  // 무한스크롤 listener 등록
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  // 무한스크롤 removeListener 등록
  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  //화면 밑 90%에 도달했을때 다음 페이지 영화 목록 fetch;
  void _onScroll() {
    if (_isBottom) {
      context.read<MovieItemsBloc>().add(const FetchMovies('star'));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        _buildSearchBar(),
        _buildKeywordDisplay(),
        _buildMovieList(),
        _buildFetchMoreMoviesIndicator(),
      ],
    );
  }

  // search bar 구성
  Widget _buildSearchBar() {
    return BlocBuilder<MovieItemsBloc, MovieItemsState>(
      builder: (context, state) {
        return HomeSearchBar(
          onSubmit: (keyword) {
            context.read<MovieItemsBloc>().add(SearchMovies(keyword: keyword));
          },
        );
      },
    );
  }

  // keyword title 구성
  Widget _buildKeywordDisplay() {
    return BlocBuilder<MovieItemsBloc, MovieItemsState>(
      builder: (context, state) {
        if (state is MovieItemsLoadSuccess) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.keyword,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }

  // MovieItemsState 상태에 따른 화면 구성
  Widget _buildMovieList() {
    return BlocBuilder<MovieItemsBloc, MovieItemsState>(
      builder: (context, state) {
        if (state is MovieItemsInitial) {
          return const SliverToBoxAdapter(
              child: Center(child: Text('키워드를 입력해주세요')));
        } else if (state is MovieItemsLoadInProgress) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else if (state is MovieItemsLoadFailure) {
          return const SliverToBoxAdapter(
              child: Center(child: Text('Failed to load movies')));
        } else if (state is MovieItemsLoadSuccess) {
          return _buildMovieListItems(state.movies.search);
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }

  Widget _buildMovieListItems(
    List<MovieItemModel> movies,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final movie = movies[index];
          return MovieItemWrapper(
            title: movie.title,
            thumbImage: movie.poster,
            releaseDate: movie.year,
            imdbID: movie.imdbID,
          );
        },
        childCount: movies.length,
      ),
    );
  }

  // 무한 스크롤 중 데이터 loading 중이거나 마지막 페이지일 경우 indicator 적용
  Widget _buildFetchMoreMoviesIndicator() {
    return BlocBuilder<MovieItemsBloc, MovieItemsState>(
        builder: (context, state) {
      if (state is MovieItemsLoadSuccess) {
        if (state.isLoadInProgress) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.isMaxReached) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('마지막 페이지입니다.'),
            ),
          );
        }
      }
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    });
  }
}
