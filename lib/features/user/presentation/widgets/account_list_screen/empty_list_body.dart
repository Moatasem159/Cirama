part of 'screen_body.dart';
class _EmptyList extends StatelessWidget {
  final ListType listType;
  const _EmptyList(this.listType);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VerticalSpace(20),
          const Icon(Icons.sentiment_dissatisfied_rounded,size: 150),
         const VerticalSpace(10),
          if (listType==ListType.ratedMovies||listType==ListType.ratedTv) 
          Text(context.locale.emptyUserList("ratings")),
          if (listType==ListType.favoriteMovies||listType==ListType.favoriteTv)
            Text(context.locale.emptyUserList("favorite")),
          if (listType==ListType.watchlistMovies||listType==ListType.watchlistTv)
            Text(context.locale.emptyUserList("watchlist")),
        ],
      ),
    );
  }
}