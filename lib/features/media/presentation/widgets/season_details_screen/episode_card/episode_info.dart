part of 'episode_card.dart';

class _EpisodeInfo extends StatelessWidget {
  final Episode episode;

  const _EpisodeInfo({required this.episode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (episode.name != "Episode ${episode.episodeNumber}")
          Row(
            children: [
              Text(
                "Episode ${episode.episodeNumber}",
                style: context.titleMedium,
              ),
              HorizontalSpace(6),
              Text(
                episode.getRuntime(),
                style: context.titleSmall.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        Text(
          episode.name,
          maxLines: null,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          episode.airDate,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        if (episode.name == "Episode ${episode.episodeNumber}")
          Text(
            episode.getRuntime(),
            style: context.titleSmall.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        VerticalSpace(4),
        Text(
          episode.overview,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}