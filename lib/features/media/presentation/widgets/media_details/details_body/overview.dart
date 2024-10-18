part of 'details_body.dart';

class _OverViewBlocBuilder extends StatelessWidget {
  const _OverViewBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      buildWhen: _shouldRebuild,
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
  bool _shouldRebuild(GetMediaDetailState previous, GetMediaDetailState current) {
    return current is GetMediaDetailSuccess || current is GetMediaDetailLoading|| current is GetMediaDetailError;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (media.overview.isNotEmpty)...[
            const VerticalSpace(6),
            Text(context.locale.summary, style: context.titleMedium),
            const VerticalSpace(6),
            ReadMoreWidget(content: media.overview),
            const VerticalSpace(6),
          ],
         if (media.voteCount > 20)...[
           _MediaRatingBar(media),
           const VerticalSpace(10),
         ]
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            media.getVoteAverage(),
            style: context.titleMedium
                .copyWith(color: context.primaryColor, height: 1),
          ),
          const HorizontalSpace(4),
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
              empty: const Icon(Icons.star_border_rounded),
              half: Icon(
                Icons.star_half_rounded,
                color: context.primaryColor,
              ),
            ),
            onRatingUpdate: (double value) {},
          ),
          const HorizontalSpace(4),
          Text(
            media.getVoteCount(),
            style: context.titleMedium.copyWith(height: 1),
          ),
        ],
      ),
    );
  }
}