import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

class EmptyItems extends StatelessWidget {
  const EmptyItems({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(context.locale.noMore,style: context.labelLarge)),
        ),
    );
  }
}