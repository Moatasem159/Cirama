part of'media_list_item_widget.dart';
class MediaImageBuilder extends StatelessWidget {
  final ImageProvider ?image;

  const MediaImageBuilder({super.key,  this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: image!, fit: BoxFit.cover),
      ),
    );
  }
}