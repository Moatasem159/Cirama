part of '../details_body.dart';

class _MediaButtonsBlocBuilder extends StatelessWidget {
  const _MediaButtonsBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MediaActionsBloc, MediaActionsState>(
      listener: (BuildContext context, MediaActionsState state) {
        if (state is FavoriteError || state is WatchlistError || state is RateError) {
          context.showSnackBar(
              snackBar(context.locale.errorMessages("default error")));
        }
      },
      child: BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
        builder: (BuildContext context, GetMediaDetailState state) {
          if (state is GetMediaDetailLoading) {
            return MediaIconButtons(enabled: true);
          }
          if (state is GetMediaDetailSuccess) {
            context.read<MediaActionsBloc>().mediaAccountDetails = state.mediaDetails.mediaAccountDetails;
            context.read<MediaActionsBloc>().mediaDetails = MediaListItem(
              id: state.mediaDetails.id,
              name: state.mediaDetails.name,
              releaseDate: state.mediaDetails.releaseDate,
              backdropPath: state.mediaDetails.backdropPath,
              originalLanguage: state.mediaDetails.originalLanguage,
              originalName: state.mediaDetails.originalName,
              overview: state.mediaDetails.overview,
              posterPath: state.mediaDetails.posterPath,
              voteAverage: state.mediaDetails.voteAverage,
              voteCount: state.mediaDetails.voteCount,
            );
            return MediaIconButtons(enabled: false);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class MediaIconButtons extends StatelessWidget {
  final bool enabled;

  const MediaIconButtons({super.key, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: const Skeleton.replace(
        replacement: _Loading(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _WatchListButton(),
            _RateButton(),
            _FavoriteButton(),
          ],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionButton(
          icon: Icons.bookmark_rounded,
          title: "Watchlist",
        ),
        _ActionButton(
          icon: Icons.star_rate_rounded,
          title: "rate",
        ),
        _ActionButton(
          icon: Icons.favorite_rounded,
          title: "Watchlist",
        ),
      ],
    );
  }
}