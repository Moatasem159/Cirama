part of 'details_app_bar.dart';
class DelegateIconButton extends StatelessWidget {
  final Icon icon;
  final double? left;
  final double? right;
  final double top;
  final double iconSize;
  final VoidCallback? onTap;

  const DelegateIconButton({
    super.key,
    required this.icon,
    this.left,
    this.right,
    required this.top,
    required this.iconSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          width: iconSize,
          height: iconSize,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.withAlpha((0.5 * 255).toInt()),
          ),
          child: FittedBox(child: icon),
        ),
      ),
    );
  }
}