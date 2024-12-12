part of 'screen_body.dart';

class _SuccessBody extends StatelessWidget {
  const _SuccessBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previous, SearchState current) =>
          current is SearchSuccess || current is SearchLoading || current is SearchEmpty|| current is LocalSearchSuccess,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchSuccess) {
          return SliverList.builder(
            itemCount: state.data.results.length,
            itemBuilder: (BuildContext context, int index) {
              switch (state.data.results[index].mediaType) {
                case SearchType.movie:
                  return _MediaSearchItem(state.data.results[index] as MediaSearch);
                case SearchType.tv:
                  return _MediaSearchItem(state.data.results[index] as MediaSearch);
                case SearchType.person:
                  //TODO:person search UI
                  return const SizedBox.shrink();
              }
            },
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

class _MediaSearchItem extends StatelessWidget {
  final bool localSearch;
  final MediaSearch media;

  const _MediaSearchItem(this.media, {this.localSearch = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!localSearch) {
          context.read<SearchBloc>().add(SaveSearch(media));
        }
        FocusScope.of(context).unfocus();
        MediaDetailsRoute(
          listType:
              media.mediaType == SearchType.movie ? ListType.noMovieList : ListType.noTvShowList,
          posterPath: media.profilePath,
          mediaId: media.id.toString(),
        ).push(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.white10 : Colors.black12,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 80,
              height: 120,
              imageUrl: ImageUrl.posterUrl(media.profilePath),
              imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>
                  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              ),
              placeholder: (BuildContext context, String url) => Skeletonizer.zone(
                child: Bone(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              errorWidget: (BuildContext context, String url, Object error) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha((0.5 * 255).toInt()),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(Icons.error_outline_rounded),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(media.getName(),
                      style: context.labelLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    if (media.overview.isNotEmpty)
                      Text(
                      media.overview,
                      style: context.labelMedium.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Text(
                          context.locale.inMedia(media.mediaType.name),
                          style: context.labelLarge.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          media.mediaType == SearchType.movie
                              ? Icons.movie_filter_rounded
                              : Icons.tv_rounded,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (localSearch)
              InkWell(
                onTap: () => context.read<SearchBloc>().add(ClearSearch(media)),
                customBorder: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Icon(
                    Icons.clear_rounded,
                    size: 20,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}