part of 'screen_body.dart';

class _OptionWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _OptionWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18,
      children: [
        Icon(icon, size: 42),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ],
    );
  }
}