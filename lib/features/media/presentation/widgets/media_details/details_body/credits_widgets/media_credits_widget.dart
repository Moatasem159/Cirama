import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';

part 'cast_list.dart';
part 'cast_member_widget.dart';
part 'media_credits_list.dart';

class CreditsBlocBuilder extends StatelessWidget {
  const CreditsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess && state.mediaDetails.credits.cast.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CastList(
                title: context.locale.cast,
                cast: state.mediaDetails.credits.cast,
              ),
              _CastList(
                title: context.locale.crew,
                cast: state.mediaDetails.credits.crew,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}