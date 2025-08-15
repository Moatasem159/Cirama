part of 'app_router.dart';
class MovieData extends StatefulShellBranchData {
  const MovieData();
}
class MovieRouteData extends GoRouteData with _$MovieRouteData {
  const MovieRouteData();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MediaScreen(
      key: ValueKey(MediaType.movie.name),
      mediaType: MediaType.movie,
    );
  }
}
class SeeMoreMoviesRoute extends GoRouteData with _$SeeMoreMoviesRoute {
  final ListType? listType;
  final MediaListResponse $extra;

  const SeeMoreMoviesRoute(this.$extra, {this.listType});

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