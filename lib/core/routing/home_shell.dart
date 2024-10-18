part of 'app_router.dart';
@TypedStatefulShellRoute<HomeShell>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<MovieData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<MovieRouteData>(
          path: '/movie',
          name: "movie",
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SeeMoreMoviesRoute>(
                path: 'seeMoreMovies/:listType', name: "seeMoreMovies"),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<TvData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TvRouteData>(
          path: '/tv',
          name: 'tv',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SeeMoreTvShowsRoute>(
                path: 'seeMoreTvShows/:listType', name: "seeMoreTvShows"),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SearchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SearchRouteData>(path: '/search'),
      ],
    ),
    TypedStatefulShellBranch<UserData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<UserRouteData>(
          path: '/user',
          name: "user",
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SettingsRoute>(
              path: 'settings',
              name: 'settings',
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<ChangeLanguageRoute>(path: "changeLanguage",name: "changeLanguage"),
                TypedGoRoute<ChangeThemeRoute>(path: "changeTheme",name: "changeTheme"),
              ]
            ),
          ],
        ),
      ],
    ),
  ],
)
class HomeShell extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey = navigatorKey;
  const HomeShell();

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) =>
      HomeScreen(navigationShell: navigationShell);
}