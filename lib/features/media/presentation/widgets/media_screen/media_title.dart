part of 'media_app_bar.dart';
class _MediaTitle extends StatelessWidget {
  final MediaType mediaType;
  const _MediaTitle(this.mediaType);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        context.locale.media(2, mediaType.name),
        style: context.headlineMedium,
        textScaler: TextScaler.linear(context.screenWidth/350),
      ),
    );
  }
}