import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
class MediaListResponse {
  final int page;
  final List<MediaListItem> mediaList;
  final int totalPages;
  final int totalResults;
  const MediaListResponse({
     this.page=0,
     this.mediaList=const[],
    this.totalPages=0,
    this.totalResults=0,
  });
  MediaListResponse copyWith({
    int? page,
    List<MediaListItem>? mediaList,
    int? totalPages,
    int? totalResults,
  }) {
    return MediaListResponse(
      page: page ?? this.page,
      mediaList: mediaList ?? this.mediaList,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}