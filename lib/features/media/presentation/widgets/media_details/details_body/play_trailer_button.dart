part of 'details_body.dart';

class _PlayTrailerButtonBlocBuilder extends StatelessWidget {
  const _PlayTrailerButtonBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailLoading) {
          return _PlayTrailerButton(
            key: ValueKey("loading"),
            enabled: true,
            media: MediaDetails.emptyMedia(context.read<GetMediaDetailCubit>().params.mediaType),
          );
        }
        if (state is GetMediaDetailSuccess) {
          return _PlayTrailerButton(
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
    return current is GetMediaDetailSuccess ||
        current is GetMediaDetailLoading ||
        current is GetMediaDetailError;
  }
}

class _PlayTrailerButton extends StatelessWidget {
  final MediaDetails media;
  final bool enabled;

  const _PlayTrailerButton({
    super.key,
    required this.media,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: MainButton(
        title: context.locale.playTrailer,
        icon: Icons.play_arrow_rounded,
        size: Size(double.infinity, 40),
        border: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        onTap: () => TrailerRoute(
          name: media.trailer.name,
          videoKey: media.trailer.key,
          site: media.trailer.site,
          type: media.trailer.type,
          official: media.trailer.official,
        ).push(context),
      ),
    );
  }
}