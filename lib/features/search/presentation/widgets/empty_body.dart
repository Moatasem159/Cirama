part of 'screen_body.dart';

class _EmptyBody extends StatelessWidget {
  const _EmptyBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previous, SearchState current) =>
          current is SearchEmpty ||
          current is SearchLoading ||
          current is SearchSuccess ||
          current is LocalSearchSuccess,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchEmpty) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.locale.noResults, style: context.titleMedium),
              ],
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}