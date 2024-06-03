// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRatingModel _$MovieRatingModelFromJson(Map<String, dynamic> json) =>
    MovieRatingModel(
      source: json['Source'] as String,
      value: json['Value'] as String,
    );

Map<String, dynamic> _$MovieRatingModelToJson(MovieRatingModel instance) =>
    <String, dynamic>{
      'Source': instance.source,
      'Value': instance.value,
    };
