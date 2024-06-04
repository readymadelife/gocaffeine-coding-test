import 'package:dio/dio.dart';
import 'package:gocaffeine/models/movie_item_detail_model.dart';
import 'package:gocaffeine/models/movie_item_response_model.dart';

class ApiService {
  final Dio _dio = Dio();

  // 영화목록 api
  Future<MovieItemResponseModel> fetchMovieItem(
      String keyword, int page) async {
    try {
      final response = await _dio
          .get('http://www.omdbapi.com/?apikey=261aa73c&s=$keyword&page=$page');

      if (response.statusCode == 200) {
        return MovieItemResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Failed to load user');
    }
  }

  // 영화정보 api
  Future<MovieItemDetailModel> fetchMovieDetail(String imdbID) async {
    try {
      final response =
          await _dio.get('https://www.omdbapi.com/?apikey=261aa73c&i=$imdbID');
      if (response.statusCode == 200) {
        return MovieItemDetailModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Failed to load movies');
    }
  }
}
