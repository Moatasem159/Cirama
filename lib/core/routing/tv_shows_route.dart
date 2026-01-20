part of 'app_router.dart';
class TvData extends StatefulShellBranchData {
  const TvData();
}
class TvRouteData extends GoRouteData with $TvRouteData {
  const TvRouteData();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MediaScreen(
      key: ValueKey(MediaType.tv.name),
      mediaType: MediaType.tv,
    );
  }
}
class SeeMoreTvShowsRoute extends GoRouteData with $SeeMoreTvShowsRoute {
  final ListType? listType;
  final MediaListResponse $extra;
  const SeeMoreTvShowsRoute(this.$extra, {this.listType});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return HorizontalSlide(
      key: state.pageKey,
      name: state.name,
      arguments: state.extra,
      direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
      child: SeeMoreMediaScreen(
        listType: listType!,
        mediaListResponse: $extra,
      ),
    );
  }
}