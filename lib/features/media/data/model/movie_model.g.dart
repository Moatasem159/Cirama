// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  credits: CreditsModel.fromJson(json['credits'] as Map<String, dynamic>),
  budget: json['budget'] as num? ?? 0,
  revenue: json['revenue'] as num? ?? 0,
  runtime: json['runtime'] as num,
  keywords: (readKeywords(json, 'keywords') as List<dynamic>)
      .map((e) => KeywordModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: (json['id'] as num).toInt(),
  name: readName(json, 'name') as String,
  status: json['status'] as String,
  tagline: json['tagline'] as String? ?? '',
  overview: json['overview'] as String? ?? '',
  homepage: json['homepage'] as String? ?? '',
  posterPath: json['poster_path'] as String? ?? '',
  releaseDate: readReleaseDate(json, 'releaseDate') as String?,
  originalName: readOriginalName(json, 'originalName') as String,
  backdropPath: json['backdrop_path'] as String? ?? '',
  originalLanguage: json['original_language'] as String,
  voteCount: json['vote_count'] as num,
  voteAverage: json['vote_average'] as num,
  genres: (json['genres'] as List<dynamic>)
      .map((e) => KeywordModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCompanies: (json['production_companies'] as List<dynamic>)
      .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  videos: (readVideo(json, 'videos') as List<dynamic>)
      .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  mediaAccountDetails: MediaAccountDetailsModel.fromJson(
    json['account_states'] as Map<String, dynamic>,
  ),
  images: GalleryModel.fromJson(json['images'] as Map<String, dynamic>),
  recommendations: MediaListResponseModel.fromJson(
    json['recommendations'] as Map<String, dynamic>,
  ),
);
