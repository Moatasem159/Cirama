import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final Icon? leading;
  final Icon? trailing;

  const CustomListTile({
    super.key,
    required this.onTap,
    required this.title,
    this.leading,
    this.trailing,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        onTap: onTap,
        subtitle: subtitle == null ? null : Text(subtitle!),
        leading: leading,
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}