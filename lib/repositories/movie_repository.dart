import 'package:gocaffeine/models/movie_item_detail_model.dart';
import 'package:gocaffeine/models/movie_item_response_model.dart';
import 'package:gocaffeine/services/apis.dart';

class MoviesRepository {
  MoviesRepository({
    required this.apiService,
  });
  final ApiService apiService;

  Future<MovieItemResponseModel> fetchMovies(String keyword, int page) async {
    return await apiService.fetchMovieItem(keyword, page);
  }

  Future<MovieItemDetailModel> fetchMovieDetail(String imdbID) async {
    return await apiService.fetchMovieDetail(imdbID);
  }
}
