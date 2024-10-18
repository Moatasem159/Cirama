part of 'playing_now_widget.dart';
class _CarousalPlaceholder extends StatelessWidget {
  const _CarousalPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Bone.square(
          size: context.screenWidth*0.9,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}