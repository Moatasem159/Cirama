import 'package:flutter/material.dart';

class PosterErrorWidget extends StatelessWidget {
  const PosterErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha((0.5 * 255).toInt()),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Icon(Icons.error_outline_rounded),
    );
  }
}