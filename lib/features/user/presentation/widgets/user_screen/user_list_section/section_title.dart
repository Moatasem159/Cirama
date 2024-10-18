part of 'user_list_section.dart';
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 18,
          width: 5,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.primaryColor,
          ),
        ),
        Text(
          title,
          style: context.titleMedium,
          textScaler: TextScaler.linear(context.screenWidth / 350),
        )
      ],
    );
  }
}