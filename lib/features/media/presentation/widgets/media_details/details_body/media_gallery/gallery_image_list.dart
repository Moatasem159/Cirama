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
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${context.locale.imageTitle(imageType.name)} : ${images.length}", style: context.titleMedium),
        _ImageList(images: images, imageType: imageType),
      ],
    );
  }
}