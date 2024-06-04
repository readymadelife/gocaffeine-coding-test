import 'package:gocaffeine/models/movie_item_detail_model.dart';
import 'package:gocaffeine/models/movie_item_response_model.dart';
import 'package:gocaffeine/services/apis.dart';

class MoviesRepository {
  MoviesRepository({
    required this.apiService,
  });
  final ApiService apiService;

  // 영화 목록 api 호출
  Future<MovieItemResponseModel> fetchMovies(String keyword, int page) async {
    return await apiService.fetchMovieItem(keyword, page);
  }

  // 영화 정보 api 호출
  Future<MovieItemDetailModel> fetchMovieDetail(String imdbID) async {
    return await apiService.fetchMovieDetail(imdbID);
  }
}
