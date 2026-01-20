part of 'playing_now_widget.dart';

class _CarousalPlaceholder extends StatelessWidget {
  const _CarousalPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 2, horizontal: 6),
      child: Skeletonizer.zone(
        child: Padding(
          padding: const .symmetric(vertical: 2),
          child: Bone(
            height: context.screenHeight / 5.5,
            width: .infinity,
            borderRadius: .circular(15),
          ),
        ),
      ),
    );
  }
}