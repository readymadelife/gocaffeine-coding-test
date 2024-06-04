import 'package:gocaffeine/models/movie_rating_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_item_detail_model.g.dart';

// 영화 상세정보 model
@JsonSerializable()
class MovieItemDetailModel {
  MovieItemDetailModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runTime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metaScore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
  });

  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Year')
  final String year;
  @JsonKey(name: 'Rated')
  final String rated;
  @JsonKey(name: 'Released')
  final String released;
  @JsonKey(name: 'Runtime')
  final String runTime;
  @JsonKey(name: 'Genre')
  final String genre;
  @JsonKey(name: 'Director')
  final String director;
  @JsonKey(name: 'Writer')
  final String writer;
  @JsonKey(name: 'Actors')
  final String actors;
  @JsonKey(name: 'Plot')
  final String plot;
  @JsonKey(name: 'Language')
  final String language;
  @JsonKey(name: 'Country')
  final String country;
  @JsonKey(name: 'Awards')
  final String awards;
  @JsonKey(name: 'Poster')
  final String poster;
  @JsonKey(name: 'Ratings')
  final List<MovieRatingModel?> ratings;
  @JsonKey(name: 'Metascore')
  final String metaScore;
  @JsonKey(name: 'imdbRating')
  final String imdbRating;
  @JsonKey(name: 'imdbVotes')
  final String imdbVotes;
  @JsonKey(name: 'imdbID')
  final String imdbID;
  @JsonKey(name: 'Type')
  final String type;
  @JsonKey(name: 'DVD')
  final String dvd;
  @JsonKey(name: 'BoxOffice')
  final String boxOffice;
  @JsonKey(name: 'Production')
  final String production;
  @JsonKey(name: 'Website')
  final String website;
  @JsonKey(name: 'Response')
  final String response;

  factory MovieItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieItemDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemDetailModelToJson(this);
}
