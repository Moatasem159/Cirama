part of 'app_router.dart';

final GlobalKey<NavigatorState> userNavigatorKey = GlobalKey<NavigatorState>();

class UserData extends StatefulShellBranchData {
  const UserData();
  static final String $initialLocation = "/user";
  static final GlobalKey<NavigatorState> $navigatorKey = userNavigatorKey;
}

class UserRouteData extends GoRouteData {
  const UserRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = userNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => const UserScreen();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = userNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => HorizontalSlide(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
        child: SettingsScreen(),
      );
}


class ChangeLanguageRoute extends GoRouteData {
  const ChangeLanguageRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = userNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => ModalBottomSheetPage<void>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        builder: (_) => const LanguageBottomSheet(),
      );
}

class ChangeThemeRoute extends GoRouteData {
  const ChangeThemeRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = userNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => ModalBottomSheetPage<void>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        builder: (_) => const ThemeBottomSheet(),
      );
}
@TypedGoRoute<AccountMediaListRoute>(path: "/accountList",name: "accountList")
class AccountMediaListRoute extends GoRouteData {
  final ListType ?listType;
  const AccountMediaListRoute(this.listType);
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => HorizontalSlide(
    key: state.pageKey,
    name: state.name,
    arguments: state.extra,
    direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
    child: AccountListScreen(listType: listType!),
  );
}