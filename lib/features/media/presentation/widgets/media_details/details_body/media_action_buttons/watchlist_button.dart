part of '../details_body.dart';

class _WatchListButton extends StatelessWidget {
  const _WatchListButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc, MediaActionsState>(
      buildWhen: (MediaActionsState previous, MediaActionsState current) {
        return current is WatchlistLoading ||
            current is WatchlistSuccess ||
            current is WatchlistError;
      },
      listenWhen: (MediaActionsState previous, MediaActionsState current) => current is WatchlistSuccess,
      listener: (BuildContext context, MediaActionsState state) {
        final ListType listType = context.read<MediaActionsBloc>().listType;
        if (state is WatchlistSuccess &&
            (listType == ListType.watchlistMovies || listType == ListType.watchlistTv)) {
          if (!context.read<MediaActionsBloc>().mediaAccountDetails.watchlist) {
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
          title: context.locale.watchlist,
          onTap: () => context.read<MediaActionsBloc>().add(WatchListMediaEvent()),
          icon: context.read<MediaActionsBloc>().mediaAccountDetails.watchlist
              ? Icons.bookmark_rounded
              : Icons.bookmark_border_rounded,
          iconColor: context.read<MediaActionsBloc>().mediaAccountDetails.watchlist
              ? Colors.green
              : Colors.grey,
        );
      },
    );
  }
}