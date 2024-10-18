part of 'get_media_detail_cubit.dart';
sealed class GetMediaDetailState {
  const GetMediaDetailState();
}
final class GetMediaDetailInitial extends GetMediaDetailState {
  const GetMediaDetailInitial();
}
final class GetMediaDetailLoading extends GetMediaDetailState {
  const GetMediaDetailLoading();
}
final class GetMediaDetailSuccess extends GetMediaDetailState {
  final MediaDetails mediaDetails;
  const GetMediaDetailSuccess({required this.mediaDetails});
}
final class GetMediaDetailError extends GetMediaDetailState {
  final String message;
  const GetMediaDetailError({required this.message});
}