part of 'app_router.dart';
final GlobalKey<NavigatorState> movieNavigatorKey = GlobalKey<NavigatorState>();
class MovieData extends StatefulShellBranchData {
  const MovieData();
  static final GlobalKey<NavigatorState> $navigatorKey =movieNavigatorKey;
}

class MovieRouteData extends GoRouteData {
  const MovieRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MediaScreen(
      key: ValueKey(MediaType.movie.name),
      mediaType: MediaType.movie,
    );
  }
}

class SeeMoreMoviesRoute extends GoRouteData {
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