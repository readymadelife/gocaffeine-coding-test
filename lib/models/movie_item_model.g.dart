// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItemModel _$MovieItemModelFromJson(Map<String, dynamic> json) =>
    MovieItemModel(
      title: json['Title'] as String,
      year: json['Year'] as String,
      imdbID: json['imdbID'] as String,
      type: json['Type'] as String,
      poster: json['Poster'] as String,
    );

Map<String, dynamic> _$MovieItemModelToJson(MovieItemModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };
