part of 'details_body.dart';

class _MediaBasicInfoBlocBuilder extends StatelessWidget {
  const _MediaBasicInfoBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, GetMediaDetailState state) {
        switch (state) {
          case GetMediaDetailInitial _:
            return const SizedBox.shrink();
          case GetMediaDetailLoading():
            return _MediaBasicInfo(
              key: ValueKey("loading"),
              media: MediaDetails.emptyMedia(context.read<GetMediaDetailCubit>().params.mediaType),
              enabled: true,
            );
          case GetMediaDetailSuccess():
            return _MediaBasicInfo(
              key: ValueKey("success"),
              media: state.mediaDetails,
              enabled: false,
            );
          case GetMediaDetailError():
            return Center(
              child: MainButton(
                  size: Size(double.maxFinite, 40),
                  border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  title: context.locale.errorMessages(state.message),
                  onTap: context.read<GetMediaDetailCubit>().getMediaDetails),
            );
        }
      },
    );
  }

  bool _shouldRebuild(GetMediaDetailState previous, GetMediaDetailState current) {
    return current is GetMediaDetailSuccess ||
        current is GetMediaDetailLoading ||
        current is GetMediaDetailError;
  }
}

class _MediaBasicInfo extends StatelessWidget {
  final MediaDetails media;
  final bool enabled;

  const _MediaBasicInfo({super.key, required this.media, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      justifyMultiLineText: true,
      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.read<GetMediaDetailCubit>().listType != ListType.noMovieList &&
              context.read<GetMediaDetailCubit>().listType != ListType.noTvShowList &&
              context.read<GetMediaDetailCubit>().listType != ListType.ratedMovies &&
              context.read<GetMediaDetailCubit>().listType != ListType.ratedTv &&
              context.read<GetMediaDetailCubit>().listType != ListType.favoriteMovies &&
              context.read<GetMediaDetailCubit>().listType != ListType.favoriteTv &&
              context.read<GetMediaDetailCubit>().listType != ListType.watchlistMovies &&
              context.read<GetMediaDetailCubit>().listType != ListType.watchlistTv) ...[
            Skeleton.keep(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Color(0xffFF6500),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      context.read<GetMediaDetailCubit>().listType.icon,
                      color: Colors.white,
                      size: context.read<GetMediaDetailCubit>().listType.iconSize,
                    ),
                    const HorizontalSpace(6),
                    Text(
                      context.locale
                          .onMediaListType(context.read<GetMediaDetailCubit>().listType.title),
                      style: context.titleMedium.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const VerticalSpace(4),
          ],
          Text(
            media.name.isNotEmpty ? media.name : media.name,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              height: 1.2,
            ),
            textScaler: TextScaler.linear(context.screenWidth / 380),
          ),
          if (media.tagline.isNotEmpty) ...[
            const VerticalSpace(6),
            Text(
              media.tagline,
              style: context.titleSmall.copyWith(
                height: 1.4,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              textScaler: TextScaler.linear(context.screenWidth / 380),
            ),
          ],
          const VerticalSpace(6),
          Text.rich(
            TextSpan(
              text: media.releaseDate.substring(0, 4),
              style: context.labelMedium,
              children: [
                TextSpan(text: " • ", style: context.labelLarge),
                TextSpan(
                  text: media.genres.keywordsToString("|"),
                ),
                if (media.getRuntime().isNotEmpty) TextSpan(text: " • ", style: context.labelLarge),
                TextSpan(text: media.getRuntime())
              ],
            ),
          ),
          VerticalSpace(4),
          _Info(title: context.locale.status, info: media.status),
          if (media is Movie) ...[
            _Info(title: context.locale.budget, info: (media as Movie).getBudget()),
            _Info(title: context.locale.revenue, info: (media as Movie).getRevenue()),
          ],
          if (media is TvShow) ...[
            _Info(title: context.locale.type, info: (media as TvShow).type),
            _Info(title: context.locale.numberOfSeasons, info:context.locale.seasons((media as TvShow).numberOfSeasons)),
            _Info(title: context.locale.numberOfEpisodes, info:context.locale.episodes((media as TvShow).numberOfEpisodes)),
          ],
          VerticalSpace(4),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String title;
  final String info;

  const _Info({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title :",
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textScaler: TextScaler.linear(context.screenWidth / 350),
        ),
        HorizontalSpace(5),
        Text(
          info,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.normal,
          ),
          textScaler: TextScaler.linear(context.screenWidth / 350),
        )
      ],
    );
  }
}