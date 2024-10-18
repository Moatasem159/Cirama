import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_details_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';

part 'movie_model.g.dart';

readKeywords(Map json, name) {
  return json[name][name];
}

@JsonSerializable(createToJson: false)
class MovieModel extends MediaDetailsModel {
  @JsonKey(required: false, defaultValue: 0)
  final num budget;
  @JsonKey(required: false, defaultValue: 0)
  final num revenue;
  final num runtime;
  @JsonKey(readValue: readKeywords)
  final List<KeywordModel> keywords;

  const MovieModel({
    required super.credits,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.keywords,
    required super.id,
    required super.name,
    required super.status,
    required super.tagline,
    required super.overview,
    required super.homepage,
    required super.posterPath,
    required super.releaseDate,
    required super.originalName,
    required super.backdropPath,
    required super.originalLanguage,
    required super.voteCount,
    required super.voteAverage,
    required super.genres,
    required super.productionCompanies,
    required super.videos,
    required super.mediaAccountDetails,
    required super.images,
    required super.recommendations,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}