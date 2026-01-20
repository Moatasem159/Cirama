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
    GoRouteData.$route(path: '/', factory: $InitialRoute._fromState);

mixin $InitialRoute on GoRouteData {
  static InitialRoute _fromState(GoRouterState state) => InitialRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login/:requestToken',
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
    requestToken: state.pathParameters['requestToken']!,
    $extra: state.extra as AuthCubit,
  );

  LoginRoute get _self => this as LoginRoute;

  @override
  String get location => GoRouteData.$location(
    '/login/${Uri.encodeComponent(_self.requestToken)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $homeShell => StatefulShellRouteData.$route(
  factory: $HomeShellExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/movie',
          name: 'movie',
          factory: $MovieRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'seeMoreMovies/:listType',
              name: 'seeMoreMovies',
              factory: $SeeMoreMoviesRoute._fromState,
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
          factory: $TvRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'seeMoreTvShows/:listType',
              name: 'seeMoreTvShows',
              factory: $SeeMoreTvShowsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/search',
          factory: $SearchRouteData._fromState,
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
          factory: $UserRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              name: 'settings',
              parentNavigatorKey: SettingsRoute.$parentNavigatorKey,
              factory: $SettingsRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'changeLanguage',
                  name: 'changeLanguage',
                  parentNavigatorKey: ChangeLanguageRoute.$parentNavigatorKey,
                  factory: $ChangeLanguageRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'changeTheme',
                  name: 'changeTheme',
                  parentNavigatorKey: ChangeThemeRoute.$parentNavigatorKey,
                  factory: $ChangeThemeRoute._fromState,
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

mixin $MovieRouteData on GoRouteData {
  static MovieRouteData _fromState(GoRouterState state) =>
      const MovieRouteData();

  @override
  String get location => GoRouteData.$location('/movie');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SeeMoreMoviesRoute on GoRouteData {
  static SeeMoreMoviesRoute _fromState(GoRouterState state) =>
      SeeMoreMoviesRoute(
        listType: _$ListTypeEnumMap._$fromName(
          state.pathParameters['listType'] ?? '',
        )!,
        state.extra as MediaListResponse,
      );

  SeeMoreMoviesRoute get _self => this as SeeMoreMoviesRoute;

  @override
  String get location => GoRouteData.$location(
    '/movie/seeMoreMovies/${Uri.encodeComponent(_$ListTypeEnumMap[_self.listType!]!)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
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

mixin $TvRouteData on GoRouteData {
  static TvRouteData _fromState(GoRouterState state) => const TvRouteData();

  @override
  String get location => GoRouteData.$location('/tv');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SeeMoreTvShowsRoute on GoRouteData {
  static SeeMoreTvShowsRoute _fromState(GoRouterState state) =>
      SeeMoreTvShowsRoute(
        listType: _$ListTypeEnumMap._$fromName(
          state.pathParameters['listType'] ?? '',
        )!,
        state.extra as MediaListResponse,
      );

  SeeMoreTvShowsRoute get _self => this as SeeMoreTvShowsRoute;

  @override
  String get location => GoRouteData.$location(
    '/tv/seeMoreTvShows/${Uri.encodeComponent(_$ListTypeEnumMap[_self.listType!]!)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $SearchRouteData on GoRouteData {
  static SearchRouteData _fromState(GoRouterState state) =>
      const SearchRouteData();

  @override
  String get location => GoRouteData.$location('/search');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $UserRouteData on GoRouteData {
  static UserRouteData _fromState(GoRouterState state) => const UserRouteData();

  @override
  String get location => GoRouteData.$location('/user');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/user/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChangeLanguageRoute on GoRouteData {
  static ChangeLanguageRoute _fromState(GoRouterState state) =>
      const ChangeLanguageRoute();

  @override
  String get location => GoRouteData.$location('/user/settings/changeLanguage');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChangeThemeRoute on GoRouteData {
  static ChangeThemeRoute _fromState(GoRouterState state) =>
      const ChangeThemeRoute();

  @override
  String get location => GoRouteData.$location('/user/settings/changeTheme');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}

RouteBase get $mediaDetailsRoute => GoRouteData.$route(
  path: '/mediaDetails',
  name: 'mediaDetails',
  factory: $MediaDetailsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'imageFullScreen',
      factory: $ImageFullScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'mediaWebPage',
      factory: $MediaWebScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'trailerPlayer',
      factory: $TrailerRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'seasonDetails',
      factory: $SeasonDetailsRoute._fromState,
    ),
  ],
);

mixin $MediaDetailsRoute on GoRouteData {
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

  MediaDetailsRoute get _self => this as MediaDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/mediaDetails',
    queryParams: {
      if (_self.mediaId != null) 'media-id': _self.mediaId,
      if (_self.listType != null)
        'list-type': _$ListTypeEnumMap[_self.listType!],
      if (_self.posterPath != null) 'poster-path': _self.posterPath,
    },
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $ImageFullScreenRoute on GoRouteData {
  static ImageFullScreenRoute _fromState(GoRouterState state) =>
      ImageFullScreenRoute(image: state.uri.queryParameters['image']);

  ImageFullScreenRoute get _self => this as ImageFullScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/mediaDetails/imageFullScreen',
    queryParams: {if (_self.image != null) 'image': _self.image},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MediaWebScreenRoute on GoRouteData {
  static MediaWebScreenRoute _fromState(GoRouterState state) =>
      MediaWebScreenRoute(url: state.uri.queryParameters['url']);

  MediaWebScreenRoute get _self => this as MediaWebScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/mediaDetails/mediaWebPage',
    queryParams: {if (_self.url != null) 'url': _self.url},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TrailerRoute on GoRouteData {
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

  TrailerRoute get _self => this as TrailerRoute;

  @override
  String get location => GoRouteData.$location(
    '/mediaDetails/trailerPlayer',
    queryParams: {
      if (_self.name != null) 'name': _self.name,
      if (_self.videoKey != null) 'video-key': _self.videoKey,
      if (_self.site != null) 'site': _self.site,
      if (_self.type != null) 'type': _self.type,
      if (_self.official != null) 'official': _self.official!.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SeasonDetailsRoute on GoRouteData {
  static SeasonDetailsRoute _fromState(GoRouterState state) =>
      SeasonDetailsRoute(
        tvShowId: _$convertMapValue(
          'tv-show-id',
          state.uri.queryParameters,
          int.tryParse,
        ),
        seasonNumber: _$convertMapValue(
          'season-number',
          state.uri.queryParameters,
          int.tryParse,
        ),
        posterPath: state.uri.queryParameters['poster-path'],
        seasonName: state.uri.queryParameters['season-name'],
        airDate: state.uri.queryParameters['air-date'],
      );

  SeasonDetailsRoute get _self => this as SeasonDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/mediaDetails/seasonDetails',
    queryParams: {
      if (_self.tvShowId != null) 'tv-show-id': _self.tvShowId!.toString(),
      if (_self.seasonNumber != null)
        'season-number': _self.seasonNumber!.toString(),
      if (_self.posterPath != null) 'poster-path': _self.posterPath,
      if (_self.seasonName != null) 'season-name': _self.seasonName,
      if (_self.airDate != null) 'air-date': _self.airDate,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
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
  factory: $AccountMediaListRoute._fromState,
);

mixin $AccountMediaListRoute on GoRouteData {
  static AccountMediaListRoute _fromState(GoRouterState state) =>
      AccountMediaListRoute(
        _$convertMapValue(
          'list-type',
          state.uri.queryParameters,
          _$ListTypeEnumMap._$fromName,
        ),
      );

  AccountMediaListRoute get _self => this as AccountMediaListRoute;

  @override
  String get location => GoRouteData.$location(
    '/accountList',
    queryParams: {
      if (_self.listType != null)
        'list-type': _$ListTypeEnumMap[_self.listType!],
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
