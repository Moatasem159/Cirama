part of 'screen_body.dart';
class EpisodesList extends StatelessWidget {
  const EpisodesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSeasonDetailsCubit, GetSeasonDetailsState>(
      builder: (BuildContext context, GetSeasonDetailsState state) {
        if (state is GetSeasonDetailsLoading) {
          return SliverList.builder(
            itemCount: 7,
            itemBuilder: (_, __) => EpisodeCard(
              enabled: true,
              episode: Episode.emptyEpisode(),
            ),
          );
        }
        if (state is GetSeasonDetailsSuccess) {
          return SliverList.builder(
            itemCount: state.seasonDetails.episodes!.length,
            itemBuilder: (context, index) => EpisodeCard(
              enabled: false,
              episode: state.seasonDetails.episodes![index],
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}