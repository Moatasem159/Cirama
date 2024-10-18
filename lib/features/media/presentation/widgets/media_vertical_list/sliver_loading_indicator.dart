import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_loading.dart';
class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: SizedBox(
            height: 35,
            width: 35,
            child: CustomLoading()
          ),
        ),
      ),
    );
  }
}