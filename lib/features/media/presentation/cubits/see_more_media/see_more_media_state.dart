part of 'see_more_media_cubit.dart';
sealed class SeeMoreMediaState {
  const SeeMoreMediaState();
}
final class SeeMoreMediaInitial extends SeeMoreMediaState {
  const SeeMoreMediaInitial();
}
final class SeeMoreMediaLoading extends SeeMoreMediaState {
  const SeeMoreMediaLoading();
}
final class SeeMoreMediaSuccess extends SeeMoreMediaState {
  const SeeMoreMediaSuccess();
}
final class LastPage extends SeeMoreMediaState {
  const LastPage();
}
final class SeeMoreMediaError extends SeeMoreMediaState {
  final String message;
  const SeeMoreMediaError({required this.message});
}