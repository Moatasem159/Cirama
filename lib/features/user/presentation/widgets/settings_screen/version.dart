import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

class Version extends StatelessWidget {
  const Version({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text("Cirama", style: context.titleMedium.copyWith(color: Colors.grey[700]!)),
        Text(
          "Version 1.1.2",
          style: context.titleSmall.copyWith(
            color: context.isDark ? Colors.grey[800]! : Colors.grey[500]!,
          ),
        ),
      ],
    );
  }
}