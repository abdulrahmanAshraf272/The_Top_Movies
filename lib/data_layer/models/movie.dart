import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  @JsonKey(name: 'title_english')
  String? titleEnglish;
  @JsonKey(name: 'title_long')
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  @JsonKey(name: 'description_full')
  String? descriptionFull;
  String? synopsis;
  @JsonKey(name: 'yt_trailer_code')
  String? ytTrailerCode;
  String? language;
  @JsonKey(name: 'mpa_rating')
  String? mpaRating;
  @JsonKey(name: 'background_image')
  String? backgroundImage;
  @JsonKey(name: 'background_image_original')
  String? backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  String? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  String? largeCoverImage;

  Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
