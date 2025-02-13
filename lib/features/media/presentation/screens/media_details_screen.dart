import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';
import 'package:movies_app/features/media/presentation/cubits/media_buttons/media_actions_bloc.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/screen_body.dart';

class MediaDetailsScreen extends StatelessWidget {
  final String mediaId;
  final String ?posterPath;
  final ListType? listType;
  const MediaDetailsScreen({
    super.key,
    required this.mediaId,
    required this.posterPath,
    required this.listType,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetMediaDetailCubit>(
          create: (BuildContext context) => GetMediaDetailCubit(
              GetIt.I.get(),
              MediaDetailsParams(mediaId: mediaId, mediaType: listType!.mediaType),
              listType!
          )..getMediaDetails(),
        ),
        BlocProvider<MediaActionsBloc>(
          create: (context) => MediaActionsBloc(
              GetIt.I.get(),
              MediaDetailsParams(mediaId: mediaId,mediaType: listType!.mediaType),
              listType!
          ),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(context).copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          body: MediaDetailsScreenBody(
            posterPath: posterPath!,
          ),
        ),
      ),
    );
  }
}