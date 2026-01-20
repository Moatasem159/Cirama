import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

part 'main_bottom_nav_bar_item.dart';

class MainBottomNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainBottomNavbar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .only(bottom: 18),
      color: context.theme.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 0,
            icon: Icons.movie_outlined,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 1,
            icon: Icons.tv,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 2,
            icon: Icons.search_rounded,
          ),
          MainBottomNavBarItem(
            navigationShell: navigationShell,
            index: 3,
            icon: Icons.account_circle_outlined,
          ),
        ],
      ),
    );
  }
}