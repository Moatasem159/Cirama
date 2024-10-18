import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final OutlinedBorder? border;
  final Size? size;
  final IconData? icon;

  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.size,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        shape: border,
      ),
      child: icon == null
          ? Text(title)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(title),
              ],
            ),
    );
  }
}