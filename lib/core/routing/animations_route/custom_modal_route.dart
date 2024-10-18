import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final bool isScrollControlled;
  const ModalBottomSheetPage({
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    required this.builder,
    this.isScrollControlled = false,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        showDragHandle: true,
        builder: builder,
        isScrollControlled: isScrollControlled,
      );
}