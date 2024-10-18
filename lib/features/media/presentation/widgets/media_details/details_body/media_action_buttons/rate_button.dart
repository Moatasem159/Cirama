part of '../details_body.dart';

class _RateButton extends StatelessWidget {
  const _RateButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaActionsBloc, MediaActionsState>(
      buildWhen: (MediaActionsState previous, MediaActionsState current) {
        return current is RateLoading ||
            current is RateSuccess ||
            current is RateError ||
            current is DeleteRateSuccess;
      },
      listenWhen: (MediaActionsState previous, MediaActionsState current) =>
          current is RateSuccess || current is DeleteRateSuccess,
      listener: (BuildContext context, MediaActionsState state) {
        final ListType listType = context.read<MediaActionsBloc>().listType;
        if (state is DeleteRateSuccess && (listType == ListType.ratedMovies || listType == ListType.ratedTv)) {
          context.read<GetAccountListCubit>().updateList(true, context.read<MediaActionsBloc>().mediaDetails);
        }
        else if (state is RateSuccess && (listType == ListType.ratedMovies || listType == ListType.ratedTv)) {
          context.read<GetAccountListCubit>().updateList(false, context.read<MediaActionsBloc>().mediaDetails);
        }
      },
      builder: (BuildContext context, MediaActionsState state) {
        return _ActionButton(
          title: context.locale.rate,
          iconSize: 28,
          icon: context.read<MediaActionsBloc>().mediaAccountDetails.ratedValue != 0.0
              ? Icons.star_rounded
              : Icons.star_outline_rounded,
          iconColor: context.read<MediaActionsBloc>().mediaAccountDetails.ratedValue != 0.0
              ? Colors.yellow
              : Colors.grey,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return BlocProvider<MediaActionsBloc>.value(
                  value: context.read<MediaActionsBloc>(),
                  child: const _RateDialog(),
                );
              },
            );
          },
        );
      },
    );
  }
}