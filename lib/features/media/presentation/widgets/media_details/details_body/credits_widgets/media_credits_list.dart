part of 'media_credits_widget.dart';
class CreditsList extends StatelessWidget {
  final List<CastMember> cast;

  const CreditsList({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => CastMemberWidget(member: cast[index]),
      ),
    );
  }
}