import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';

class Version extends StatelessWidget {
  const Version({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(10),
        Text("Cirama",style: context.titleMedium.copyWith(color: Colors.grey[700]!)),
        Text("Version 1.0.1",style: context.titleSmall.copyWith(color: context.isDark?Colors.grey[800]!:Colors.grey[500]!)),
        const VerticalSpace(10),
      ],
    );
  }
}