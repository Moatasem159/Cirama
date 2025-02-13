part of 'details_body.dart';

class MediaRecommendationsBlocBuilder extends StatelessWidget {
  const MediaRecommendationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess && state.mediaDetails.recommendations.mediaList.isNotEmpty) {
          return _MediaRecommendations(mediaListResponse: state.mediaDetails.recommendations);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _MediaRecommendations extends StatelessWidget {
  final MediaListResponse mediaListResponse;

  const _MediaRecommendations({required this.mediaListResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.recommendations,
          style: context.titleMedium,
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: mediaListResponse.mediaList.length + 1,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index != mediaListResponse.mediaList.length) {
                return MediaListItemWidget(
                  media: mediaListResponse.mediaList[index],
                  listType: (context.read<GetMediaDetailCubit>().listType.mediaType == MediaType.movie)
                      ? ListType.noMovieList
                      : ListType.noTvShowList,
                );
              }
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }
}