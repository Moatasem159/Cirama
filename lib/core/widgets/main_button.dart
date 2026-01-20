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
    return icon == null
        ? ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(fixedSize: size, shape: border),
            child: Text(title),
          )
        : ElevatedButton.icon(
            style: ElevatedButton.styleFrom(fixedSize: size, shape: border),
            onPressed: onTap,
            label: Text(title),
            icon: Icon(icon),
          );
  }
}