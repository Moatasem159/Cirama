import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/extensions/string_extension.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/presentation/cubits/see_more_media/see_more_media_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/see_more_media/screen_body.dart';

class SeeMoreMediaScreen extends StatelessWidget {
  final MediaListResponse mediaListResponse;
  final ListType listType;

  const SeeMoreMediaScreen({super.key, required this.mediaListResponse, required this.listType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SeeMoreMediaCubit>(
      create: (BuildContext context) => SeeMoreMediaCubit(
        MediaListParams(
          mediaType: listType.mediaType,
          listType: listType,
        ),
        GetIt.I.get(),
      )..mediaListResponse = mediaListResponse,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 60,
          toolbarHeight: 80,
          leading: IconButton(
            onPressed: context.pop,
            splashRadius: 20,
            iconSize: context.screenWidth / 18,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back,
              size: context.screenWidth / 18,
            ),
          ),
          title: Text(
            "${context.locale.listType(listType.title)} ${context.locale.media(2, listType.mediaType.name).firstLetterToLowerCase()}",
            style: context.titleMedium.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textScaler: TextScaler.linear(context.screenWidth / 350),
          ),
        ),
        body: const SeeMoreMediaScreenBody(),
      ),
    );
  }
}