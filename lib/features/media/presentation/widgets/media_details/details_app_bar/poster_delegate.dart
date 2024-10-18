part of 'details_app_bar.dart';

class PosterDelegate extends SliverPersistentHeaderDelegate {
  final String posterPath;
  final ScrollController controller;

  PosterDelegate({required this.posterPath, required this.controller});

  final double maxSize = 520;
  final double minSize = 200;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double shrinkFactor = shrinkOffset / maxSize;
    const double maxIconSize = 32;
    const double mixIconSize = 28;
    final double iconSize = (maxIconSize * (1 - shrinkFactor)).clamp(mixIconSize, maxIconSize);
    return GestureDetector(
      onTap: () =>
          controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        fit: StackFit.expand,
        children: [
          _PosterWidget(posterPath: posterPath),
          LogoWidget(shrinkFactor: shrinkFactor),
          DelegateIconButton(
            left: 25,
            top: 50,
            iconSize: iconSize,
            onTap: () {
              if (controller.position.pixels == controller.position.minScrollExtent) {
                context.pop(true);
              } else if (controller.position.atEdge) {
                controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
              }
            },
            icon: context.isEnglish ? Icon(Icons.arrow_back) : Icon(Icons.arrow_forward),
          ),
          _LinkButton(shrinkFactor: shrinkFactor, iconSize: iconSize),
        ],
      ),
    );
  }

  @override
  double get minExtent => minSize;

  @override
  double get maxExtent => maxSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}