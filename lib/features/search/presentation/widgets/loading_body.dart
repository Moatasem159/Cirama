part of 'screen_body.dart';

class _SearchLoadingBody extends StatelessWidget {
  const _SearchLoadingBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previous, SearchState current) =>
          current is SearchLoading || current is SearchSuccess|| current is SearchEmpty || current is SearchError,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchLoading) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                VerticalSpace(8),
                CustomLoading(),
              ],
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}