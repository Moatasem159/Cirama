import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/poster_error_widget.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/poster_placeholder.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_list/get_account_list_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'media_image_builder.dart';

class MediaListItemWidget extends StatelessWidget {
  final ListType listType;
  final MediaListItem media;

  const MediaListItemWidget({
    super.key,
    required this.media,
    required this.listType,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: const PosterPlaceholder(),
      child: GestureDetector(
        onTap: () {
          if (listType == ListType.watchlistMovies ||
              listType == ListType.watchlistTv ||
              listType == ListType.favoriteMovies ||
              listType == ListType.favoriteTv ||
              listType == ListType.ratedMovies ||
              listType == ListType.ratedTv) {
            MediaDetailsRoute(
              listType: listType,
              $extra: context.read<GetAccountListCubit>(),
              posterPath: media.posterPath,
              mediaId: media.id.toString(),
            ).push(context);
          }
          else{
            MediaDetailsRoute(
              listType: listType,
              posterPath: media.posterPath,
              mediaId: media.id.toString(),
            ).push(context);
          }
        },
        child: CachedNetworkImage(
            imageUrl: ImageUrl.posterUrl(media.posterPath),
            imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>
                MediaImageBuilder(image: imageProvider),
            placeholder: (BuildContext context, String url) => const PosterPlaceholder(),
            errorWidget: (BuildContext context, String url, Object error) => PosterErrorWidget()),
      ),
    );
  }
}