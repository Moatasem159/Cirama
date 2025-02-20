part of 'app_router.dart';
class SearchData extends StatefulShellBranchData {
  const SearchData();
}
class SearchRouteData extends GoRouteData {
  const SearchRouteData();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchScreen();
}