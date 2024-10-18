part of 'media_gallery.dart';

class _GalleryImageList extends StatelessWidget {
  final List<ImageEntity> images;
  final ImageType imageType;

  const _GalleryImageList({required this.images, required this.imageType});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(6),
          Text("${context.locale.imageTitle(imageType.name)} : ${images.length}", style: context.titleMedium),
          const VerticalSpace(6),
          _ImageList(images: images, imageType: imageType),
          const VerticalSpace(6),
        ],
      ),
    );
  }
}