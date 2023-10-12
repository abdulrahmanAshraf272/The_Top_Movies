// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      movieCount: json['movieCount'] as int?,
      limit: json['limit'] as int?,
      pageNumber: json['pageNumber'] as int?,
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movieCount': instance.movieCount,
      'limit': instance.limit,
      'pageNumber': instance.pageNumber,
      'movies': instance.movies,
    };
