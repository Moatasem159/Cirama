import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';

part 'media_list_response_model.g.dart';

@JsonSerializable()
class MediaListResponseModel {
  final int page;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;
  @JsonKey(name: "results")
  final List<MediaListItemModel> mediaList;

  const MediaListResponseModel({
    required this.page,
    required this.mediaList,
    required this.totalPages,
    required this.totalResults,
  });

  factory MediaListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MediaListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaListResponseModelToJson(this);
}

@JsonSerializable()
class MediaListItemModel extends MediaModel {
  const MediaListItemModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    required super.posterPath,
    required super.releaseDate,
    required super.originalName,
    required super.backdropPath,
    required super.originalLanguage,
  });

  factory MediaListItemModel.fromJson(Map<String, dynamic> json) =>
      _$MediaListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaListItemModelToJson(this);
}