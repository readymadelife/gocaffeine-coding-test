import 'package:gocaffeine/models/movie_item_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_item_response_model.g.dart';

// 영화 목록 호출시 response model
@JsonSerializable()
class MovieItemResponseModel {
  MovieItemResponseModel({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  @JsonKey(name: 'Search')
  final List<MovieItemModel> search;

  @JsonKey(name: 'totalResults')
  final String totalResults;

  @JsonKey(name: 'Response')
  final String response;

  factory MovieItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieItemResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemResponseModelToJson(this);
}
