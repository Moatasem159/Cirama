part of 'media_gallery.dart';

class _ImageList extends StatelessWidget {
  final List<ImageEntity> images;
  final ImageType imageType;

  const _ImageList({required this.images, required this.imageType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / imageType.height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            _Image(imageType: imageType, image: images[index]),
      ),
    );
  }
}