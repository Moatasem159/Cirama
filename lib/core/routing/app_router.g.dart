// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $initialRoute,
  $loginRoute,
  $homeShell,
  $mediaDetailsRoute,
  $accountMediaListRoute,
];

RouteBase get $initialRoute =>
    GoRouteData.$route(path: '/', factory: $InitialRouteExtension._fromState);

extension $InitialRouteExtension on InitialRoute {
  static InitialRoute _fromState(GoRouterState state) => InitialRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login/:requestToken',

  factory: $LoginRouteExtension._fromState,
);

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
    requestToken: state.pathParameters['requestToken']!,
    $extra: state.extra as AuthCubit,
  );

  String get location =>
      GoRouteData.$location('/login/${Uri.encodeComponent(requestToken)}');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $homeShell => StatefulShellRouteData.$route(
  factory: $HomeShellExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/movie',
          name: 'movie',

          factory: $MovieRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'seeMoreMovies/:listType',
              name: 'seeMoreMovies',

              factory: $SeeMoreMoviesRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/tv',
          name: 'tv',

          factory: $TvRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'seeMoreTvShows/:listType',
              name: 'seeMoreTvShows',

              factory: $SeeMoreTvShowsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/search',

          factory: $SearchRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: UserData.$navigatorKey,
      initialLocation: UserData.$initialLocation,

      routes: [
        GoRouteData.$route(
          path: '/user',
          name: 'user',
          parentNavigatorKey: UserRouteData.$parentNavigatorKey,

          factory: $UserRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              name: 'settings',
              parentNavigatorKey: SettingsRoute.$parentNavigatorKey,

              factory: $SettingsRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'changeLanguage',
                  name: 'changeLanguage',
                  parentNavigatorKey: ChangeLanguageRoute.$parentNavigatorKey,

                  factory: $ChangeLanguageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'changeTheme',
                  name: 'changeTheme',
                  parentNavigatorKey: ChangeThemeRoute.$parentNavigatorKey,

                  factory: $ChangeThemeRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $HomeShellExtension on HomeShell {
  static HomeShell _fromState(GoRouterState state) => const HomeShell();
}

extension $MovieRouteDataExtension on MovieRouteData {
  static MovieRouteData _fromState(GoRouterState state) =>
      const MovieRouteData();

  String get location => GoRouteData.$location('/movie');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SeeMoreMoviesRouteExtension on SeeMoreMoviesRoute {
  static SeeMoreMoviesRoute _fromState(GoRouterState state) =>
      SeeMoreMoviesRoute(
        listType: _$ListTypeEnumMap._$fromName(
          state.pathParameters['listType']!,
        ),
        state.extra as MediaListResponse,
      );

  String get location => GoRouteData.$location(
    '/movie/seeMoreMovies/${Uri.encodeComponent(_$ListTypeEnumMap[listType!]!)}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

const _$ListTypeEnumMap = {
  ListType.playingNowMovie: 'playing-now-movie',
  ListType.playingNowTvShow: 'playing-now-tv-show',
  ListType.trendingMovie: 'trending-movie',
  ListType.trendingTvShow: 'trending-tv-show',
  ListType.popularMovie: 'popular-movie',
  ListType.popularTvShow: 'popular-tv-show',
  ListType.topRatedMovie: 'top-rated-movie',
  ListType.topRatedTvShow: 'top-rated-tv-show',
  ListType.ratedMovies: 'rated-movies',
  ListType.ratedTv: 'rated-tv',
  ListType.favoriteMovies: 'favorite-movies',
  ListType.favoriteTv: 'favorite-tv',
  ListType.watchlistMovies: 'watchlist-movies',
  ListType.watchlistTv: 'watchlist-tv',
  ListType.noMovieList: 'no-movie-list',
  ListType.noTvShowList: 'no-tv-show-list',
};

extension $TvRouteDataExtension on TvRouteData {
  static TvRouteData _fromState(GoRouterState state) => const TvRouteData();

  String get location => GoRouteData.$location('/tv');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SeeMoreTvShowsRouteExtension on SeeMoreTvShowsRoute {
  static SeeMoreTvShowsRoute _fromState(GoRouterState state) =>
      SeeMoreTvShowsRoute(
        listType: _$ListTypeEnumMap._$fromName(
          state.pathParameters['listType']!,
        ),
        state.extra as MediaListResponse,
      );

  String get location => GoRouteData.$location(
    '/tv/seeMoreTvShows/${Uri.encodeComponent(_$ListTypeEnumMap[listType!]!)}',
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $SearchRouteDataExtension on SearchRouteData {
  static SearchRouteData _fromState(GoRouterState state) =>
      const SearchRouteData();

  String get location => GoRouteData.$location('/search');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserRouteDataExtension on UserRouteData {
  static UserRouteData _fromState(GoRouterState state) => const UserRouteData();

  String get location => GoRouteData.$location('/user');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location('/user/settings');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangeLanguageRouteExtension on ChangeLanguageRoute {
  static ChangeLanguageRoute _fromState(GoRouterState state) =>
      const ChangeLanguageRoute();

  String get location => GoRouteData.$location('/user/settings/changeLanguage');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangeThemeRouteExtension on ChangeThemeRoute {
  static ChangeThemeRoute _fromState(GoRouterState state) =>
      const ChangeThemeRoute();

  String get location => GoRouteData.$location('/user/settings/changeTheme');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $mediaDetailsRoute => GoRouteData.$route(
  path: '/mediaDetails',
  name: 'mediaDetails',

  factory: $MediaDetailsRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'imageFullScreen',

      factory: $ImageFullScreenRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: 'mediaWebPage',

      factory: $MediaWebScreenRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: 'trailerPlayer',

      factory: $TrailerRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: 'seasonDetails',

      factory: $SeasonDetailsRouteExtension._fromState,
    ),
  ],
);

extension $MediaDetailsRouteExtension on MediaDetailsRoute {
  static MediaDetailsRoute _fromState(GoRouterState state) => MediaDetailsRoute(
    mediaId: state.uri.queryParameters['media-id'],
    listType: _$convertMapValue(
      'list-type',
      state.uri.queryParameters,
      _$ListTypeEnumMap._$fromName,
    ),
    posterPath: state.uri.queryParameters['poster-path'],
    $extra: state.extra as GetAccountListCubit?,
  );

  String get location => GoRouteData.$location(
    '/mediaDetails',
    queryParams: {
      if (mediaId != null) 'media-id': mediaId,
      if (listType != null) 'list-type': _$ListTypeEnumMap[listType!],
      if (posterPath != null) 'poster-path': posterPath,
    },
  );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ImageFullScreenRouteExtension on ImageFullScreenRoute {
  static ImageFullScreenRoute _fromState(GoRouterState state) =>
      ImageFullScreenRoute(image: state.uri.queryParameters['image']);

  String get location => GoRouteData.$location(
    '/mediaDetails/imageFullScreen',
    queryParams: {if (image != null) 'image': image},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MediaWebScreenRouteExtension on MediaWebScreenRoute {
  static MediaWebScreenRoute _fromState(GoRouterState state) =>
      MediaWebScreenRoute(url: state.uri.queryParameters['url']);

  String get location => GoRouteData.$location(
    '/mediaDetails/mediaWebPage',
    queryParams: {if (url != null) 'url': url},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TrailerRouteExtension on TrailerRoute {
  static TrailerRoute _fromState(GoRouterState state) => TrailerRoute(
    name: state.uri.queryParameters['name'],
    videoKey: state.uri.queryParameters['video-key'],
    site: state.uri.queryParameters['site'],
    type: state.uri.queryParameters['type'],
    official: _$convertMapValue(
      'official',
      state.uri.queryParameters,
      _$boolConverter,
    ),
  );

  String get location => GoRouteData.$location(
    '/mediaDetails/trailerPlayer',
    queryParams: {
      if (name != null) 'name': name,
      if (videoKey != null) 'video-key': videoKey,
      if (site != null) 'site': site,
      if (type != null) 'type': type,
      if (official != null) 'official': official!.toString(),
    },
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SeasonDetailsRouteExtension on SeasonDetailsRoute {
  static SeasonDetailsRoute _fromState(GoRouterState state) =>
      SeasonDetailsRoute(
        tvShowId: int.parse(state.uri.queryParameters['tv-show-id']!),
        seasonNumber: int.parse(state.uri.queryParameters['season-number']!),
        posterPath: state.uri.queryParameters['poster-path'],
        seasonName: state.uri.queryParameters['season-name']!,
        airDate: state.uri.queryParameters['air-date']!,
      );

  String get location => GoRouteData.$location(
    '/mediaDetails/seasonDetails',
    queryParams: {
      'tv-show-id': tvShowId.toString(),
      'season-number': seasonNumber.toString(),
      if (posterPath != null) 'poster-path': posterPath,
      'season-name': seasonName,
      'air-date': airDate,
    },
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $accountMediaListRoute => GoRouteData.$route(
  path: '/accountList',
  name: 'accountList',

  factory: $AccountMediaListRouteExtension._fromState,
);

extension $AccountMediaListRouteExtension on AccountMediaListRoute {
  static AccountMediaListRoute _fromState(GoRouterState state) =>
      AccountMediaListRoute(
        _$ListTypeEnumMap._$fromName(state.uri.queryParameters['list-type']!),
      );

  String get location => GoRouteData.$location(
    '/accountList',
    queryParams: {'list-type': _$ListTypeEnumMap[listType]},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
