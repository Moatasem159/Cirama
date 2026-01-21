// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowModel _$TvShowModelFromJson(Map<String, dynamic> json) => TvShowModel(
  numberOfSeasons: (json['number_of_seasons'] as num).toInt(),
  numberOfEpisodes: (json['number_of_episodes'] as num).toInt(),
  type: json['type'] as String,
  lastAirDate: json['last_air_date'] as String?,
  episodeRunTime: (json['episode_run_time'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  keywords: (readKeywords(json, 'keywords') as List<dynamic>)
      .map((e) => KeywordModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  seasons: (json['seasons'] as List<dynamic>)
      .map((e) => TvShowSeasonModel.fromJson(e as Map<String, dynamic>))
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
  credits: CreditsModel.fromJson(json['credits'] as Map<String, dynamic>),
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

TvShowSeasonModel _$TvShowSeasonModelFromJson(Map<String, dynamic> json) =>
    TvShowSeasonModel(
      airDate: json['air_date'] as String?,
      episodeCount: (json['episode_count'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num).toInt(),
    );

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
  airDate: json['air_date'] as String,
  episodeNumber: (json['episode_number'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String,
  runtime: (json['runtime'] as num?)?.toInt(),
  seasonNumber: (json['season_number'] as num).toInt(),
  showId: (json['show_id'] as num).toInt(),
  stillPath: json['still_path'] as String?,
  crew: (json['crew'] as List<dynamic>)
      .map((e) => CastMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  guestStars: (json['guest_stars'] as List<dynamic>)
      .map((e) => CastMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
