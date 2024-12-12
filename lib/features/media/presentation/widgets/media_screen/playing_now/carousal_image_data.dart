part of 'playing_now_widget.dart';

class _CarousalImageData extends StatelessWidget {
  final Media media;

  const _CarousalImageData(this.media);

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: 8, vertical: 2);
    const EdgeInsetsGeometry margin =
        EdgeInsets.symmetric(horizontal: 2, vertical: 1);
    const BoxDecoration decoration = BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
    return Skeleton.ignore(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: padding,
              margin: margin,
              decoration: decoration,
              child: Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(media.getVoteAverage(),
                    style: context.titleSmall.copyWith(color: Colors.white),
                    textScaler: TextScaler.linear(context.screenWidth / 500),
                  ),
                  Icon(
                    Icons.star_rounded,
                    size: context.screenWidth / 25,
                    color: Colors.yellow,
                    opticalSize: 25,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: padding,
            margin: margin,
            decoration: decoration,
            child: Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  context.locale.listType(ListType.playingNowMovie.title),
                  style: context.titleSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                  textScaler: TextScaler.linear(context.screenWidth / 590),
                ),
                Icon(Icons.circle,
                    opticalSize: 12,
                    color: Colors.redAccent,
                    size: context.screenWidth / 45),
              ],
            ),
          ),
          Container(
            padding: padding,
            margin: margin,
            decoration: decoration,
            child: Text(
              media.name.isNotEmpty ? media.name : media.originalName,
              maxLines: null,
              overflow: TextOverflow.visible,
              style: context.titleMedium.copyWith(
                color: Colors.white,
              ),
              textScaler: TextScaler.linear(context.screenWidth / 580),),
          ),
        ],
      ),
    );
  }
}