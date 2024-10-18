part of 'screen_body.dart';
class _SeasonScreenAppBar extends StatelessWidget {
  final String? posterPath;
  final String seasonName;
  final String airDate;

  const _SeasonScreenAppBar({
    required this.posterPath,
    required this.seasonName,
    required this.airDate,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 540,
      flexibleSpace: Hero(
        tag: "hero$posterPath",
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: ShaderMask(
            shaderCallback: (Rect rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [
                0,
                0.3,
                0.5,
                1,
              ],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height)),
            blendMode: BlendMode.dstATop,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: ImageUrl.posterUrl(posterPath ?? ""),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error_outline_rounded),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(0, 60),
        child: FittedBox(
          child: Column(
            children: [
              Text(
                seasonName,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textScaler: TextScaler.linear(context.screenWidth / 350),
              ),
              Text(
                airDate,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textScaler: TextScaler.linear(context.screenWidth / 350),
              ),
            ],
          ),
        ),
      ),
    );
  }
}