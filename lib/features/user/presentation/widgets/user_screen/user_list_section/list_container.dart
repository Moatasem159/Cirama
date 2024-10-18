part of 'user_list_section.dart';

enum ContainerTitle {
  ratedMovies,
  ratedTv,
  favoriteMovies,
  favoriteTv,
  watchlistMovies,
  watchlistTv,
}

class _ListContainer extends StatelessWidget {
  final IconData icon;
  final ContainerTitle title;
  final Color iconColor;

  const _ListContainer(
    this.icon,
    this.title,
    this.iconColor,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          final ListType listType;
          switch (title) {
            case ContainerTitle.ratedMovies:
              listType = ListType.ratedMovies;
            case ContainerTitle.ratedTv:
              listType = ListType.ratedTv;
            case ContainerTitle.favoriteMovies:
              listType = ListType.favoriteMovies;
            case ContainerTitle.favoriteTv:
              listType = ListType.favoriteTv;
            case ContainerTitle.watchlistMovies:
              listType = ListType.watchlistMovies;
            case ContainerTitle.watchlistTv:
              listType = ListType.watchlistTv;
          }
          AccountMediaListRoute(listType).push(context);
        },
        child: Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              VerticalSpace(10),
              Text(
                context.locale.userLists(title.name),
                textAlign: TextAlign.center,
                style: context.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}