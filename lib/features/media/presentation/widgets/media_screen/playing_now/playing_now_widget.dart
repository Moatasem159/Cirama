import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_list/get_media_list_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/list_title.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'carousal_image_builder.dart';
part 'carousal_image_data.dart';
part 'carousal_item.dart';
part 'carousal_placeholder.dart';
part 'carousel_builder.dart';
part 'playing_now_error_widget.dart';
part 'playing_now_section.dart';

class PlayingNowWidget extends StatelessWidget {
  final ListType listType;

  const PlayingNowWidget({super.key, required this.listType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetMediaListCubit>(
      create: (BuildContext context) => GetMediaListCubit(
        GetIt.I.get(),
        MediaListParams(
          mediaType: listType.mediaType,
          listType: listType,
        ),
      )..getMediaList(),
      child: BlocBuilder<GetMediaListCubit, GetMediaListState>(
        builder: (BuildContext context, GetMediaListState state) {
          switch (state) {
            case GetMediaListInitial _:
              return const SliverToBoxAdapter();
            case GetMediaListLoading _:
              final MediaListResponse fakeResponse = MediaListResponse(
                page: 0,
                mediaList: List.filled(5, MediaListItem()),
                totalPages: 0,
                totalResults: 0,
              );
              return _PlayingNowSection(
                listType: listType,
                key: const ValueKey("loading"),
                enabled: true,
                mediaListResponse: fakeResponse,
              );
            case GetMediaListSuccess _:
              return _PlayingNowSection(
                key: const ValueKey("success"),
                enabled: false,
                listType: listType,
                mediaListResponse: state.media,
              );
            case GetMediaListError _:
              return _PlayingNowErrorWidget(
                listType: listType,
                message: state.message,
              );
          }
        },
      ),
    );
  }
}