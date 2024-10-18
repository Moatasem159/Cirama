part of 'playing_now_widget.dart';
class _PlayingNowSection extends StatelessWidget {
  final bool enabled;
  final ListType listType;
  final MediaListResponse mediaListResponse;

  const _PlayingNowSection({
    super.key,
    required this.mediaListResponse,
    required this.enabled,
    required this.listType,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      ignorePointers: false,
      enabled: enabled,
      child: SliverToBoxAdapter(
        child: Column(
          children: [
            const VerticalSpace(10),
            ListTitle(
              title: context.locale.listType(listType.title),
              onPressed: () {
                switch(listType.mediaType) {
                  case MediaType.movie:
                    SeeMoreMoviesRoute(mediaListResponse,listType: listType).push(context);
                  case MediaType.tv:
                    SeeMoreTvShowsRoute(mediaListResponse,listType: listType).push(context);
                }
              },
            ),
            const VerticalSpace(10),
            _CarouselBuilder(mediaListResponse.mediaList),
            const VerticalSpace(10),
          ],
        ),
      ),
    );
  }
}