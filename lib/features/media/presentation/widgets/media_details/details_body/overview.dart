part of 'details_body.dart';

class _OverViewBlocBuilder extends StatelessWidget {
  const _OverViewBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailLoading) {
          return _Overview(
            key: ValueKey("loading"),
            enabled: true,
            media: MediaDetails.emptyMedia(
                context.read<GetMediaDetailCubit>().params.mediaType),
          );
        }
        if (state is GetMediaDetailSuccess) {
          return _Overview(
            key: ValueKey("success"),
            media: state.mediaDetails,
            enabled: false,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _Overview extends StatelessWidget {
  final MediaDetails media;
  final bool enabled;

  const _Overview({
    super.key,
    required this.media,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (media.overview.isNotEmpty)...[
            Text(context.locale.summary, style: context.titleMedium),
            ReadMoreWidget(content: media.overview),
          ],
         if (media.voteCount > 20)...[
           _MediaRatingBar(media),
         ],
        ],
      ),
    );
  }
}
class _MediaRatingBar extends StatelessWidget {
  final Media media;

  const _MediaRatingBar(this.media);

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignore(
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            media.getVoteAverage(),
            style: context.titleMedium
                .copyWith(color: context.primaryColor, height: 1),
          ),
          RatingBar(
            itemSize: 24,
            initialRating: media.voteAverage.toDouble() / 2,
            itemPadding: EdgeInsets.only(bottom: 3),
            ignoreGestures: true,
            allowHalfRating: true,
            minRating: 0,
            maxRating: 5,
            itemCount: 5,
            glowColor: Colors.yellow,
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.star_rate_rounded,
                color: context.primaryColor,
              ),
              empty:  Icon(Icons.star_border_rounded,color: context.isDark?Colors.white:Colors.black,),
              half: Icon(
                Icons.star_half_rounded,
                color: context.primaryColor,
              ),
            ),
            onRatingUpdate: (double value) {},
          ),
          Text(
            media.getVoteCount(),
            style: context.titleMedium.copyWith(height: 1),
          ),
        ],
      ),
    );
  }
}