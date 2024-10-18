import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/poster_error_widget.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/poster_placeholder.dart';

class SeasonPosterImage extends StatelessWidget {
  final String? image;

  const SeasonPosterImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero$image",
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          width: 130,
          height: 200,
          fit: BoxFit.cover,
          imageUrl: ImageUrl.posterUrl(image??""),
          placeholder: (context, url) => PosterPlaceholder(),
          errorWidget: (context, url, error) =>PosterErrorWidget(),
        ),
      ),
    );
  }
}