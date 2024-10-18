import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PosterPlaceholder extends StatelessWidget {
  final double size;
  const PosterPlaceholder({super.key,this.size=130});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Skeletonizer.zone(
          child: Bone.square(
            size: size,
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}