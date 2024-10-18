import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';
import 'package:movies_app/features/media/data/model/movie_model.dart';
import 'package:movies_app/features/media/data/model/tv_show_model.dart';

part 'media_details_model.g.dart';

readVideo(Map json, name) {
  return json[name]['results'];
}

readMedia(Map json, _) {
  return json;
}

@JsonSerializable(createToJson: false)
class MediaDetailsResponseModel {
  @JsonKey(readValue: readMedia)
  @MediaConverter()
  final MediaDetailsModel mediaDetails;

  const MediaDetailsResponseModel({required this.mediaDetails});

  factory MediaDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MediaDetailsResponseModelFromJson(json);
}

abstract class MediaDetailsModel extends MediaModel {
  final String status;
  @JsonKey(defaultValue: '')
  final String tagline;
  @JsonKey(defaultValue: '')
  final String homepage;
  final List<KeywordModel> genres;
  @JsonKey(name: "production_companies")
  final List<NetworkModel> productionCompanies;
  final GalleryModel images;
  @JsonKey(readValue: readVideo)
  final List<VideoModel> videos;
  final CreditsModel credits;
  @JsonKey(name: "account_states")
  final MediaAccountDetailsModel mediaAccountDetails;
  @JsonKey(name: "recommendations")
  final MediaListResponseModel recommendations;

  const MediaDetailsModel({
    required this.status,
    required this.tagline,
    required this.homepage,
    required this.genres,
    required this.productionCompanies,
    required this.images,
    required this.videos,
    required this.credits,
    required this.mediaAccountDetails,
    required this.recommendations,
    required super.id,
    required super.name,
    required super.overview,
    required super.originalName,
    required super.voteCount,
    required super.voteAverage,
    required super.backdropPath,
    required super.posterPath,
    required super.releaseDate,
    required super.originalLanguage,
  });
}

class MediaConverter implements JsonConverter<MediaDetailsModel, Map<String, dynamic>> {
  const MediaConverter();

  @override
  MediaDetailsModel fromJson(Map<String, dynamic> json) {
    if (json['original_title'] != null) {
      return MovieModel.fromJson(json);
    } else {
      return TvShowModel.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(MediaModel data) => {};
}