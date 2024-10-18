part of 'details_app_bar.dart';
class _PosterWidget extends StatelessWidget {
  const _PosterWidget({required this.posterPath});
  final String posterPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.scaffoldBackgroundColor,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0, 0.4, 0.6, 1],
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.dstATop,
        child: CachedNetworkImage(
          imageUrl: ImageUrl.posterUrl(posterPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}