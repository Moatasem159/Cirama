part of 'media_actions_bloc.dart';
abstract class MediaActionsState {
  const MediaActionsState();
}
class  MediaActionsInitial extends MediaActionsState {
  const MediaActionsInitial();
}
class FavoriteLoading extends MediaActionsState{
  const FavoriteLoading();
}
class FavoriteSuccess extends MediaActionsState{
  const FavoriteSuccess();
}
class FavoriteError extends MediaActionsState{
  const FavoriteError();
}
class WatchlistLoading extends MediaActionsState{
  const WatchlistLoading();
}
class WatchlistSuccess extends MediaActionsState{
  const WatchlistSuccess();
}
class WatchlistError extends MediaActionsState{
  const WatchlistError();
}
class RateLoading extends MediaActionsState{
  const RateLoading();
}
class RateSuccess extends MediaActionsState{
  const RateSuccess();
}
class DeleteRateSuccess extends MediaActionsState{
  const DeleteRateSuccess();
}
class RateError extends MediaActionsState{
  const RateError();
}