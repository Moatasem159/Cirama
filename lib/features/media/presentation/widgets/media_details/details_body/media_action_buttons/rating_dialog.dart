part of '../details_body.dart';

class _RateDialog extends StatelessWidget {
  const _RateDialog();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        actionsAlignment: MainAxisAlignment.center,
        buttonPadding: EdgeInsets.zero,
        alignment: AlignmentDirectional.center,
        content: RatingBar(
            itemSize: 27,
            allowHalfRating: true,
            glowRadius: 2,
            initialRating: context
                .read<MediaActionsBloc>()
                .mediaAccountDetails
                .ratedValue
                .toDouble(),
            minRating: .5,
            maxRating: 10,
            itemCount: 10,
            updateOnDrag: true,
            glow: false,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star_rate_rounded, color: Colors.yellow),
              empty: const Icon(Icons.star_border_rounded),
              half: const Icon(Icons.star_half_rounded, color: Colors.yellow),
            ),
            onRatingUpdate: context.read<MediaActionsBloc>().updateRateValue),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () {
              context.read<MediaActionsBloc>().getLastRate();
              context.pop();
            },
          ),
          IconButton(
            iconSize: 25,
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<MediaActionsBloc>().updateRateValue(0);
              context.read<MediaActionsBloc>().add(DeleteRateMediaEvent());
              context.pop();
            },
          ),
          IconButton(
            iconSize: 32,
            splashRadius: 5,
            icon: Icon(
              Icons.star_purple500_rounded,
              color: Colors.lightGreen,
            ),
            onPressed: () {
              context.read<MediaActionsBloc>().add(RateMediaEvent());
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}