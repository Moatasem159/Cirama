part of 'media_gallery.dart';

class _Image extends StatelessWidget {
  final ImageEntity image;
  final ImageType imageType;

  const _Image({required this.image, required this.imageType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ImageFullScreenRoute(image: image.filePath).push(context),
      child: Hero(
        tag: image.filePath,
        child: image.filePath.endsWith(".svg")
            ? AspectRatio(
                aspectRatio: 2,
                child: SvgPicture.network(
                  ImageUrl.backDropsUrl(image.filePath),
                ),
              )
            : CachedNetworkImage(
                width: context.screenWidth * imageType.width,
                imageUrl: ImageUrl.posterUrl(image.filePath),
                imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>
                    ImageBuilder(imageType: imageType, imageProvider: imageProvider),
                placeholder: (BuildContext context, String url) =>
                    _ImagePlaceholder(imageType: imageType),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const SizedBox.shrink(),
              ),
      ),
    );
  }
}

class ImageBuilder extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  final ImageType imageType;

  const ImageBuilder({super.key, required this.imageType, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: imageType == ImageType.logos
          ? const EdgeInsets.symmetric(horizontal: 15)
          : const EdgeInsets.symmetric(horizontal: 5),
      width: context.screenWidth * imageType.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: imageType == ImageType.logos ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final ImageType imageType;

  const _ImagePlaceholder({required this.imageType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Skeletonizer.zone(
        child: Bone.square(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}