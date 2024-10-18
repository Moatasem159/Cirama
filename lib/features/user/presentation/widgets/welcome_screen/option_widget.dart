part of 'screen_body.dart';
class _OptionWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _OptionWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Icon(icon,size:40,),
          const VerticalSpace(10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.titleMedium  .copyWith(
                fontWeight: FontWeight.normal
            ),
          ),
        ],
      ),
    );
  }
}