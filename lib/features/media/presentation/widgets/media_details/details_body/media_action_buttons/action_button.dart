part of '../details_body.dart';

class _ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? iconSize;

  const _ActionButton({
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: iconSize),
            Text(title, style: context.titleMedium,textScaler: TextScaler.linear(context.screenWidth / 350),),
          ],
        ),
      ),
    );
  }
}