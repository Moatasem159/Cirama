part of 'get_season_details_cubit.dart';
sealed class GetSeasonDetailsState {
  const GetSeasonDetailsState();
}
final class GetSeasonDetailsLoading extends GetSeasonDetailsState {
  const GetSeasonDetailsLoading();
}
final class GetSeasonDetailsSuccess extends GetSeasonDetailsState {
  final TvShowSeason seasonDetails;
  const GetSeasonDetailsSuccess(this.seasonDetails);
}
final class GetSeasonDetailsError extends GetSeasonDetailsState {
  final String message;
  const GetSeasonDetailsError(this.message);
}