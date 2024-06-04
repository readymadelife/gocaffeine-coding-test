import 'package:json_annotation/json_annotation.dart';
part 'movie_item_model.g.dart';

// 영화 목록 호출 시 영화 정보 model
@JsonSerializable()
class MovieItemModel {
  MovieItemModel({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Year')
  final String year;

  @JsonKey(name: 'imdbID')
  final String imdbID;

  @JsonKey(name: 'Type')
  final String type;

  @JsonKey(name: 'Poster')
  final String poster;

  factory MovieItemModel.fromJson(Map<String, dynamic> json) =>
      _$MovieItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemModelToJson(this);
}
