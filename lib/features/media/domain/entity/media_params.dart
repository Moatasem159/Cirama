import 'package:movies_app/features/media/domain/entity/media_enums.dart';

abstract class MediaParams {
  final MediaType mediaType;

  const MediaParams({
    required this.mediaType,
  });
}

class MediaListParams extends MediaParams {
  final ListType listType;
  final int page;

  const MediaListParams({
    required super.mediaType,
    required this.listType,
    this.page = 1,
  });

  MediaListParams copyWith({
    MediaType? mediaType,
    ListType? listType,
    int? page,
  }) {
    return MediaListParams(
      mediaType: mediaType ?? this.mediaType,
      listType: listType ?? this.listType,
      page: page ?? this.page,
    );
  }
}

class MediaDetailsParams extends MediaParams {
  final String mediaId;

  const MediaDetailsParams({
    required super.mediaType,
    required this.mediaId,
  });
}

class MediaActionParams extends MediaParams {
  final String mediaId;
  final String actionType;
  final double ratingValue;
  final bool actionValue;

  const MediaActionParams({
    required super.mediaType,
    required this.mediaId,
    required this.actionType,
    this.ratingValue = 0,
    this.actionValue = false,
  });
}

class SeasonDetailsParams extends MediaParams {
  final int mediaId;
  final int seasonNumber;
  const SeasonDetailsParams(
      {required super.mediaType, required this.mediaId, required this.seasonNumber});
}