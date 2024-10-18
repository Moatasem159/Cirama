part of 'playing_now_widget.dart';
class _CarousalImageBuilder extends StatelessWidget {
  final ImageProvider image;
  final Media media;

  const _CarousalImageBuilder(this.image, this.media);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: context.screenHeight/5.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(fit: BoxFit.cover, image: image),
      ),
      child: _CarousalImageData(media),
    );
  }
}