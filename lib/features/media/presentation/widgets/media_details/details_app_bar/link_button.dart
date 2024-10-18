part of 'details_app_bar.dart';

class _LinkButton extends StatelessWidget {
  final double shrinkFactor;
  final double iconSize;

  const _LinkButton({required this.iconSize, required this.shrinkFactor});

  @override
  Widget build(BuildContext context) {
    final double linkIconTop = calculateIconPosition(
      start: 90,
      end: 66.5,
      shrinkFactor: shrinkFactor,
      invert: true,
    );
    final double linkIconLeft = calculateIconPosition(
      start: 25,
      end: 60,
      shrinkFactor: shrinkFactor,
    );
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess) {
          if (state.mediaDetails.homepage.isNotEmpty) {
            return DelegateIconButton(
              left: linkIconLeft,
              top: linkIconTop,
              iconSize: iconSize,
              icon: Icon(CupertinoIcons.link, size: iconSize),
              onTap: () => MediaWebScreenRoute(url: state.mediaDetails.homepage).push(context),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }

  bool _shouldRebuild(GetMediaDetailState previous, GetMediaDetailState current) {
    return current is GetMediaDetailSuccess || current is GetMediaDetailLoading;
  }
}