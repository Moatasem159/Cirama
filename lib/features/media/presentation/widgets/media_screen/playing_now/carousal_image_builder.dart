part of 'playing_now_widget.dart';
class _CarousalImageBuilder extends StatelessWidget {
  final ImageProvider image;
  final Media media;

  const _CarousalImageBuilder(this.image, this.media);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 6, vertical: 6),
      margin: const .symmetric(vertical: 2,horizontal: 6),
      height: context.screenHeight/5.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(15),
        image: DecorationImage(fit: BoxFit.cover, image: image),
      ),
      child: _CarousalImageData(media),
    );
  }
}