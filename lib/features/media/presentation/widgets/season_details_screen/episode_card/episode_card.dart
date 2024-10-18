import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'episode_image.dart';
part 'episode_info.dart';
class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final bool enabled;

  const EpisodeCard({super.key, required this.episode, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Container(
        decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _EpisodeImage(image: episode.stillPath),
            VerticalSpace(5),
            _EpisodeInfo(episode: episode),
            VerticalSpace(5),
          ],
        ),
      ),
    );
  }
}