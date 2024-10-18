part of 'screen_body.dart';

class _RecentSearch extends StatelessWidget {
  const _RecentSearch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previous, SearchState current) =>
          current is LocalSearchSuccess || current is SearchLoading,
      builder: (BuildContext context, SearchState state) {
        if (state is LocalSearchSuccess && state.data.isNotEmpty) {
          return SliverAppBar(
            pinned: true,
            flexibleSpace: Container(
              color: context.scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.locale.recentSearch, style: context.titleMedium),
                    TextButton(
                      onPressed: () => context.read<SearchBloc>().add(ClearAllSearch()),
                      child: Text(context.locale.clear),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}