part of 'screen_body.dart';

class _LocalSearchBody extends StatelessWidget {
  const _LocalSearchBody();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previous, SearchState current) =>
      current is LocalSearchSuccess || current is SearchLoading,
      builder: (BuildContext context, SearchState state) {
        if (state is LocalSearchSuccess && state.data.isNotEmpty) {
          return SliverList.builder(
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int index) {
              switch (state.data[index].mediaType) {
                case SearchType.movie:
                  return _MediaSearchItem(state.data[index] as MediaSearch, localSearch: true);
                case SearchType.tv:
                  return _MediaSearchItem(state.data[index] as MediaSearch, localSearch: true);
                case SearchType.person:
                //TODO:person search UI
                  return const SizedBox.shrink();
              }
            },
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}