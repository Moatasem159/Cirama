import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/seasons_list_widgets/season_poster.dart';

class SeasonsBlocBuilder extends StatelessWidget {
  const SeasonsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess && state.mediaDetails is TvShow) {
          return SeasonsListWidget(tvShow: state.mediaDetails as TvShow);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class SeasonsListWidget extends StatelessWidget {
  final TvShow tvShow;

  const SeasonsListWidget({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing:20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.locale.seasons(tvShow.numberOfSeasons), style: context.titleMedium),
        SizedBox(
          height:306,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: tvShow.seasons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SeasonPoster(
              season: tvShow.seasons[index],
              tvShowId: tvShow.id,
              tvShowName: tvShow.originalName,
            ),
          ),
        ),
      ],
    );
  }
}