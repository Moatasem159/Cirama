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
      spacing: 4,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2,right: 2,top: 6),
          child: Text(
            title,
            style: context.titleMedium,
          ),
        ),
        CreditsList(cast: cast),
      ],
    );
  }
}