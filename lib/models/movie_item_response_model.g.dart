// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItemResponseModel _$MovieItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    MovieItemResponseModel(
      search: (json['Search'] as List<dynamic>)
          .map((e) => MovieItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as String,
      response: json['Response'] as String,
    );

Map<String, dynamic> _$MovieItemResponseModelToJson(
        MovieItemResponseModel instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'totalResults': instance.totalResults,
      'Response': instance.response,
    };
