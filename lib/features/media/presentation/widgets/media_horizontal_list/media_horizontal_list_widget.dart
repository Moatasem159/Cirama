import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_list/get_media_list_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/list_title.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/media_list_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'media_horizontal_list.dart';

class MediaHorizontalListWidget extends StatelessWidget {
  final ListType listType;
  const MediaHorizontalListWidget({
    super.key,
    required this.listType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetMediaListCubit>(
      create: (BuildContext context) => GetMediaListCubit(
        GetIt.I.get(),
        MediaListParams(mediaType: listType.mediaType, listType: listType),
      )..getMediaList(),
      child: BlocBuilder<GetMediaListCubit, GetMediaListState>(
        builder: (context, state) {
          switch (state) {
            case GetMediaListInitial _:
              return const SliverToBoxAdapter();
            case GetMediaListLoading():
              final MediaListResponse fakeResponse = MediaListResponse(
                page: 0,
                mediaList: List.filled(5, MediaListItem()),
                totalPages: 0,
                totalResults: 0,
              );
              return MediaHorizontalList(
                key: const ValueKey("loading"),
                listType: listType,
                enabled: true,
                mediaListResponse: fakeResponse,
              );
            case GetMediaListSuccess():
              return MediaHorizontalList(
                key: const ValueKey("success"),
                listType: listType,
                enabled: false,
                mediaListResponse: state.media,
              );
            case GetMediaListError():
              //TODO: add error ui
              return SliverToBoxAdapter(
                child: Text(
                  context.locale.errorMessages(state.message),
                ),
              );
          }
        },
      ),
    );
  }
}