part of'media_credits_widget.dart';
class _CastList extends StatelessWidget {
  final String title;
  final List<CastMember> cast;

  const _CastList({
    required this.title,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            title,
            style: context.labelMedium,
          ),
        ),
        VerticalSpace(4),
        CreditsList(cast: cast),
        VerticalSpace(4),
      ],
    );
  }
}