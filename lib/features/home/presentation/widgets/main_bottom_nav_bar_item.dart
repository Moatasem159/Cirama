part of 'main_bottom_nav_bar.dart';

class MainBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final StatefulNavigationShell navigationShell;

  const MainBottomNavBarItem({
    super.key,
    required this.icon,
    required this.index,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigationShell.goBranch(index,initialLocation: index == navigationShell.currentIndex),
      child: Container(
        width: context.screenWidth / 5,
        height: context.screenHeight * 0.055,
        decoration: BoxDecoration(
          color: navigationShell.currentIndex == index ? (context.isDark?Colors.white10:Colors.black12): Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: navigationShell.currentIndex == index
                  ? context.theme.primaryColor
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Icon(
          icon,
          color: navigationShell.currentIndex == index
              ? context.theme.primaryColor
              : Colors.grey,
        ),
      ),
    );
  }
}