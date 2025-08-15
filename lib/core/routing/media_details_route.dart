part of 'app_router.dart';

@TypedGoRoute<MediaDetailsRoute>(
  path: '/mediaDetails',
  name: "mediaDetails",
  routes: [
    TypedGoRoute<ImageFullScreenRoute>(path: "imageFullScreen"),
    TypedGoRoute<MediaWebScreenRoute>(path: "mediaWebPage"),
    TypedGoRoute<TrailerRoute>(path: "trailerPlayer"),
    TypedGoRoute<SeasonDetailsRoute>(path: "seasonDetails"),
  ],
)
class MediaDetailsRoute extends GoRouteData with _$MediaDetailsRoute {
  final String? posterPath;
  final String? mediaId;
  final ListType? listType;
  final GetAccountListCubit? $extra;

  const MediaDetailsRoute({
    required this.mediaId,
    required this.listType,
    required this.posterPath,
    this.$extra,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    if ($extra != null) {
      return SlideFromDownToUp(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: BlocProvider<GetAccountListCubit>.value(
          value: $extra!,
          child: MediaDetailsScreen(
            mediaId: mediaId!,
            posterPath: posterPath,
            listType: listType,
          ),
        ),
      );
    } else {
      return SlideFromDownToUp(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: MediaDetailsScreen(
          mediaId: mediaId!,
          posterPath: posterPath,
          listType: listType,
        ),
      );
    }
  }
}

class ImageFullScreenRoute extends GoRouteData with _$ImageFullScreenRoute {
  final String? image;

  const ImageFullScreenRoute({required this.image});

  @override
  Widget build(BuildContext context, GoRouterState state) => ImageFullscreen(image: image);
}

class MediaWebScreenRoute extends GoRouteData with _$MediaWebScreenRoute {
  final String? url;

  const MediaWebScreenRoute({required this.url});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => HorizontalSlide(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
        child: MediaWebScreen(url: url),
      );
}

class TrailerRoute extends GoRouteData with _$TrailerRoute {
  final String? name;
  final String? videoKey;
  final String? site;
  final String? type;
  final bool? official;

  TrailerRoute(
      {required this.name,
      required this.videoKey,
      required this.site,
      required this.type,
      required this.official});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => HorizontalSlide(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
        child: TrailerScreen(
          name: name,
          videoKey: videoKey,
          site: site,
          type: type,
          official: official,
        ),
      );
}

class SeasonDetailsRoute extends GoRouteData with _$SeasonDetailsRoute {
  final int ?tvShowId;
  final int ?seasonNumber;
  final String? posterPath;
  final String ?seasonName;
  final String ?airDate;

  const SeasonDetailsRoute({
    required this.tvShowId,
    required this.seasonNumber,
    required this.posterPath,
    required this.seasonName,
    required this.airDate,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => SeasonDetailsScreen(
        tvShowId: tvShowId!,
        seasonNumber: seasonNumber!,
        posterPath: posterPath,
        seasonName: seasonName!,
        airDate: airDate!,
      );
}