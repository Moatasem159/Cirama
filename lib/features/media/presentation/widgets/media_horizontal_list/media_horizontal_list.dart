part of 'media_horizontal_list_widget.dart';

class MediaHorizontalList extends StatelessWidget {
  final ListType listType;
  final bool enabled;
  final MediaListResponse mediaListResponse;

  const MediaHorizontalList({
    super.key,
    required this.listType,
    required this.enabled,
    required this.mediaListResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      ignorePointers: false,
      enabled: enabled,
      child: SliverToBoxAdapter(
        child: Column(
          spacing: 10,
          children: [
            ListTitle(
              title: context.locale.listType(listType.title),
              onPressed: () {
                switch (listType.mediaType) {
                  case MediaType.movie:
                    SeeMoreMoviesRoute(
                      mediaListResponse,
                      listType: listType,
                    ).push(context);
                  case MediaType.tv:
                    SeeMoreTvShowsRoute(
                      mediaListResponse,
                      listType: listType,
                    ).push(context);
                }
              },
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: mediaListResponse.mediaList.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MediaListItemWidget(
                  media: mediaListResponse.mediaList[index],
                  listType: listType,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}