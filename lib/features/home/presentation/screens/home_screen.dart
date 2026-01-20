import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/home/presentation/widgets/main_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppTheme.systemUiOverlayStyle(context),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (navigationShell.currentIndex != 0) {
            navigationShell.goBranch(0);
          }
        },
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: MainBottomNavbar(
            navigationShell: navigationShell,
          ),
        ),
      ),
    );
  }
}