part of 'playing_now_widget.dart';
class _CarouselBuilder extends StatelessWidget {
  final List<Media> mediaList;
  const _CarouselBuilder(this.mediaList);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: mediaList.length,
      itemBuilder: (_, index, __) => _CarousalItem(mediaList[index]),
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: context.enabled ? false : true,
        viewportFraction: 0.8,
        height: context.screenHeight/5.5,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}