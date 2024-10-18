part of 'media_actions_bloc.dart';
abstract class MediaActionsEvents{
  const MediaActionsEvents();
}
class RateMediaEvent extends MediaActionsEvents{
  const RateMediaEvent();
}
class DeleteRateMediaEvent extends MediaActionsEvents{
  const DeleteRateMediaEvent();
}
class FavMediaEvent extends MediaActionsEvents{
  const FavMediaEvent();
}
class WatchListMediaEvent extends MediaActionsEvents{
  const WatchListMediaEvent();
}