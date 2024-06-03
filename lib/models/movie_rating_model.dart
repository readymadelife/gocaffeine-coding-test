import 'package:json_annotation/json_annotation.dart';

part 'movie_rating_model.g.dart';

@JsonSerializable()
class MovieRatingModel {
  MovieRatingModel({
    required this.source,
    required this.value,
  });

  @JsonKey(name: "Source")
  final String source;

  @JsonKey(name: "Value")
  final String value;

  factory MovieRatingModel.fromJson(Map<String, dynamic> json) =>
      _$MovieRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRatingModelToJson(this);
}
