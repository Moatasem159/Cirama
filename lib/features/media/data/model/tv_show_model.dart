import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_details_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';

part 'tv_show_model.g.dart';

dynamic readKeywords(Map json, name) {
  return json[name]["results"];
}

@JsonSerializable(createToJson: false)
class TvShowModel extends MediaDetailsModel {
  @JsonKey(name: "number_of_seasons")
  final int numberOfSeasons;
  @JsonKey(name: "number_of_episodes")
  final int numberOfEpisodes;
  final String type;
  @JsonKey(name: "last_air_date")
  final String ?lastAirDate;
  @JsonKey(name: "episode_run_time")
  final List<int> episodeRunTime;
  final List<TvShowSeasonModel> seasons;
  @JsonKey(readValue: readKeywords)
  final List<KeywordModel> keywords;

  const TvShowModel({
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.type,
    required this.lastAirDate,
    required this.episodeRunTime,
    required this.keywords,
    required this.seasons,
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
    required super.credits,
    required super.genres,
    required super.productionCompanies,
    required super.videos,
    required super.mediaAccountDetails,
    required super.images,
    required super.recommendations,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) => _$TvShowModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class TvShowSeasonModel {
  @JsonKey(name: "air_date",required: false)
  final String ?airDate;
  @JsonKey(name: "episode_count",required: false)
  final int ?episodeCount;
  final int id;
  @JsonKey(required: false)
  final List<EpisodeModel>? episodes;
  final String name;
  final String overview;
  @JsonKey(name: "poster_path",required: false)
  final String ?posterPath;
  @JsonKey(name: "season_number")
  final int seasonNumber;

  const TvShowSeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  factory TvShowSeasonModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowSeasonModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeModel {
  @JsonKey(name: "air_date")
  final String airDate;
  @JsonKey(name: "episode_number")
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  @JsonKey(required: false)
  final int ?runtime;
  @JsonKey(name: "season_number")
  final int seasonNumber;
  @JsonKey(name: "show_id")
  final int showId;
  @JsonKey(name: "still_path",required:  false)
  final String ?stillPath;
  final List<CastMemberModel> crew;
  @JsonKey(name: "guest_stars")
  final List<CastMemberModel> guestStars;

  const EpisodeModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.crew,
    required this.guestStars,
  });
  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
}