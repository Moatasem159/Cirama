part of 'details_app_bar.dart';
class LogoWidget extends StatelessWidget {
  final double shrinkFactor;
  const LogoWidget({super.key, required this.shrinkFactor});
  @override
  Widget build(BuildContext context) {
    const double minLogoSize = 240;
    const double maxLogoSize = 290;
    final double imageWidth = (maxLogoSize * (1 - shrinkFactor)).clamp(minLogoSize, maxLogoSize);
    return Positioned(
      bottom: 20,
      child: BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
        buildWhen: _shouldRebuild,
        builder: (BuildContext context, GetMediaDetailState state) {
          if (state is GetMediaDetailSuccess) {
            if (state.mediaDetails.logoPath!=null) {
              if (state.mediaDetails.logoPath!.filePath.endsWith(".svg"))
              {
                return SvgPicture.network(
                  ImageUrl.backDropsUrl(state.mediaDetails.logoPath!.filePath),
                  width: imageWidth,
                  colorFilter: ColorFilter.mode(Colors.white12, BlendMode.color),
                );
              } else {
                if (state.mediaDetails.logoPath!.aspectRatio < 1.5) {
                  const double minLogoSize = 100;
                  const double maxLogoSize = 150;
                  final double imageWidth = (maxLogoSize * (1 - shrinkFactor))
                      .clamp(minLogoSize, maxLogoSize);
                  return SizedBox(
                    width: imageWidth,
                    child: AspectRatio(
                      aspectRatio:state.mediaDetails.logoPath!.aspectRatio.toDouble(),
                      child: CachedNetworkImage(
                        imageUrl:
                        ImageUrl.backDropsUrl(state.mediaDetails.logoPath!.filePath),
                      ),
                    ),
                  );
                }
                return CachedNetworkImage(
                  width: imageWidth,
                  imageUrl: ImageUrl.backDropsUrl(state.mediaDetails.logoPath!.filePath),
                );
              }

            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
  bool _shouldRebuild(GetMediaDetailState previous, GetMediaDetailState current) {
    return current is GetMediaDetailSuccess || current is GetMediaDetailLoading;
  }
}