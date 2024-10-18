part of 'app_router.dart';
class SearchData extends StatefulShellBranchData {
  static final GlobalKey<NavigatorState> $navigatorKey =  GlobalKey<NavigatorState>();
  const SearchData();
}
class SearchRouteData extends GoRouteData {

  const SearchRouteData();


  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchScreen();
}