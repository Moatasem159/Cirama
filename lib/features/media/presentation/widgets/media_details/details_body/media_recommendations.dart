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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.recommendations,
          style: context.titleMedium,
        ),
        VerticalSpace(8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: mediaListResponse.mediaList.length + 1,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index != mediaListResponse.mediaList.length) {
                return MediaListItemWidget(
                  media: mediaListResponse.mediaList[index],
                  listType: switch (context.read<GetMediaDetailCubit>().listType.mediaType) {
                    MediaType.movie => ListType.noMovieList,
                    MediaType.tv => ListType.noTvShowList,
                  },
                );
              }
              return SizedBox();
            },
          ),
        ),
        VerticalSpace(18),
      ],
    );
  }
}