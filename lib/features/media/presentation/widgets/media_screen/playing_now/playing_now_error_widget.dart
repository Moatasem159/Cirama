part of 'playing_now_widget.dart';
class _PlayingNowErrorWidget extends StatelessWidget {
  final ListType listType;
  final String message;

  const _PlayingNowErrorWidget({
    required this.listType,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTitle(title: context.locale.listType(listType.title)),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha((0.5 * 255).toInt()),
              borderRadius: BorderRadius.circular(15),
            ),
            height: context.screenHeight / 4.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.locale.errorMessages(message),
                ),
                MainButton(
                  title: context.locale.pleaseTryAgain,
                  onTap: context.read<GetMediaListCubit>().getMediaList,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}