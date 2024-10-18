
part of 'screen_body.dart';

class _SeasonOverview extends StatelessWidget {
  const _SeasonOverview();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSeasonDetailsCubit, GetSeasonDetailsState>(
      builder: (BuildContext context, GetSeasonDetailsState state) {
        switch (state) {
          case GetSeasonDetailsInitial _:
            return const SliverToBoxAdapter();
          case GetSeasonDetailsLoading _:
            return _SeasonOverviewWidget(enabled: true, overview: TvShowSeason.emptySeason().overview);
          case GetSeasonDetailsSuccess():
            return _SeasonOverviewWidget(enabled: false, overview: state.seasonDetails.overview);
          case GetSeasonDetailsError():
            return Center(
              child: MainButton(
                  size: Size(double.maxFinite, 40),
                  border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  title: context.locale.errorMessages(state.message),
                  onTap: context.read<GetSeasonDetailsCubit>().getSeasonDetails),
            );
        }
      },
    );
  }
}

class _SeasonOverviewWidget extends StatelessWidget {
  final String  overview;
  final bool enabled;

  const _SeasonOverviewWidget({required this.overview, required this.enabled});

  @override
  Widget build(BuildContext context) {
    if (overview.isEmpty) {
      return const SliverToBoxAdapter();
    }
    return Skeletonizer.sliver(
      enabled: enabled,
      ignorePointers: false,
      child: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              VerticalSpace(10),
              Text(overview),
            ],
          ),
        ),
      ),
    );
  }
}