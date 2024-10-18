part of 'get_media_list_cubit.dart';

sealed class GetMediaListState {
  const GetMediaListState();
}

final class GetMediaListInitial extends GetMediaListState {
  const GetMediaListInitial();
}

final class GetMediaListLoading extends GetMediaListState {
  const GetMediaListLoading();
}

final class GetMediaListSuccess extends GetMediaListState {
  final String time;
  final String local;
  final MediaListResponse media;
  const GetMediaListSuccess({required this.local,required this.media,required this.time});
  factory GetMediaListSuccess.fromJson(Map<String, dynamic> json) {
    final MediaListResponseModel model=MediaListResponseModel.fromJson(json['media']);
    final MediaListResponse media = MediaMapper.mediaListResponseModelToMediaListResponse(model);
    return GetMediaListSuccess(
      media: media,
      time: json['time'],
      local: json['local'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'media': MediaModelMapper.mediaListResponseToMediaListResponseModel(media).toJson(),
      'time': time,
      'local': local,
    };
  }
}
final class GetMediaListError extends GetMediaListState {
  final String message;
  const GetMediaListError(this.message);
}