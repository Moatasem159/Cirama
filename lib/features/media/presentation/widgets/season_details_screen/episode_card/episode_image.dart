part of 'episode_card.dart';
class _EpisodeImage extends StatelessWidget {
  final String? image;

  const _EpisodeImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: const EpisodeImagePlaceholder(),
      child: CachedNetworkImage(
        height: 180,
        imageUrl: ImageUrl.posterUrl(image ?? ""),
        imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (BuildContext context, String url) => const EpisodeImagePlaceholder(),
        errorWidget: (BuildContext context, String url, _) => Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withAlpha((0.5 * 255).toInt()),
          ),
          child: Icon(Icons.error_outline_rounded),
        ),
      ),
    );
  }
}
class EpisodeImagePlaceholder extends StatelessWidget {
  const EpisodeImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Bone(
        width: double.infinity,
        height: 180,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}