part of 'playing_now_widget.dart';

class _CarousalItem extends StatelessWidget {
  final Media media;

  const _CarousalItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: const _CarousalPlaceholder(),
      child: GestureDetector(
        onTap: () {
          switch (context.read<GetMediaListCubit>().params.mediaType) {
            case MediaType.movie:
              MediaDetailsRoute(
                listType: context.read<GetMediaListCubit>().params.listType,
                posterPath: media.posterPath,
                mediaId: media.id.toString(),
              ).push(context);
            case MediaType.tv:
              MediaDetailsRoute(
                posterPath: media.posterPath,
                listType: context.read<GetMediaListCubit>().params.listType,
                mediaId: media.id.toString(),
              ).push(context);
          }
        },
        child: CachedNetworkImage(
          imageUrl: ImageUrl.posterUrl(media.backdropPath),
          imageBuilder: (_, ImageProvider<Object> imageProvider) =>
              _CarousalImageBuilder(imageProvider, media),
          placeholder: (context, url) => const _CarousalPlaceholder(),
        ),
      ),
    );
  }
}