import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/presentation/widgets/media_horizontal_list/media_horizontal_list_widget.dart';
import 'package:movies_app/features/media/presentation/widgets/media_screen/media_app_bar.dart';
import 'package:movies_app/features/media/presentation/widgets/media_screen/playing_now/playing_now_widget.dart';

class MediaScreen extends StatelessWidget {
  final MediaType mediaType;

  const MediaScreen({super.key,required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: [
        const SliverVerticalSpace(20),
        MediaAppBar(mediaType: mediaType),
        PlayingNowWidget(
          listType:
              mediaType == MediaType.movie ? ListType.playingNowMovie : ListType.playingNowTvShow,
        ),
        MediaHorizontalListWidget(
          listType: mediaType == MediaType.movie ? ListType.trendingMovie : ListType.trendingTvShow,
        ),
        MediaHorizontalListWidget(
          listType: mediaType == MediaType.movie ? ListType.popularMovie : ListType.popularTvShow,
        ),
        MediaHorizontalListWidget(
          listType: mediaType == MediaType.movie ? ListType.topRatedMovie : ListType.topRatedTvShow,
        ),
        const SliverVerticalSpace(20),
      ],
    );
  }
}