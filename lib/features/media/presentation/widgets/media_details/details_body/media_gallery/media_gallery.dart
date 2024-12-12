import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'gallery_image_list.dart';
part 'image.dart';
part 'image_list.dart';
class MediaGalleryBlocBuilder extends StatelessWidget {
  const MediaGalleryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess && state.mediaDetails.gallery.isNotEmpty()) {
          return _GalleryWidget(gallery: state.mediaDetails.gallery);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
class _GalleryWidget extends StatelessWidget {
  final Gallery gallery;

  const _GalleryWidget({required this.gallery});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.locale.gallery, style: context.titleMedium),
        _GalleryImageList(images: gallery.backdrops, imageType: ImageType.backdrops),
        _GalleryImageList(images: gallery.posters, imageType: ImageType.posters),
        _GalleryImageList(images: gallery.logos, imageType: ImageType.logos),
      ],
    );
  }
}