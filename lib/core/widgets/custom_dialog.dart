import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;
  final String okText;
  final String cancelText;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
    required this.okText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      titlePadding: const EdgeInsets.only(top: 15, bottom: 5, left: 10, right: 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
      title: Text(
        title,
        style: context.titleSmall,
      ),
      content: Text(
        content,
        style: context.labelSmall.copyWith(fontWeight: FontWeight.w400),
      ),
      actions: [
        TextButton(onPressed: onTap, child: Text(okText)),
        TextButton(onPressed: context.pop, child: Text(cancelText))
      ],
    );
  }
}