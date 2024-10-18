part of '../details_body.dart';

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc, MediaActionsState>(
      buildWhen: (MediaActionsState previous, MediaActionsState current){
        return current is FavoriteSuccess ||
            current is FavoriteLoading ||
            current is FavoriteError;
      },
      listenWhen: (MediaActionsState previous, MediaActionsState current) =>current is FavoriteSuccess,
      listener: (BuildContext context, MediaActionsState state) {
        final ListType listType = context.read<MediaActionsBloc>().listType;
        if (state is FavoriteSuccess &&
            (listType == ListType.favoriteMovies || listType == ListType.favoriteTv)) {
          if (!context.read<MediaActionsBloc>().mediaAccountDetails.favorite) {
            context
                .read<GetAccountListCubit>()
                .updateList(true, context.read<MediaActionsBloc>().mediaDetails);
          } else {
            context
                .read<GetAccountListCubit>()
                .updateList(false, context.read<MediaActionsBloc>().mediaDetails);
          }
        }
      },
      builder: (BuildContext context, MediaActionsState state) {
        return _ActionButton(
          title: context.locale.favorite,
          onTap: () => context.read<MediaActionsBloc>().add(FavMediaEvent()),
          icon: context.read<MediaActionsBloc>().mediaAccountDetails.favorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          iconColor:
              context.read<MediaActionsBloc>().mediaAccountDetails.favorite
                  ? Colors.red
                  : Colors.grey,
        );
      },
    );
  }
}