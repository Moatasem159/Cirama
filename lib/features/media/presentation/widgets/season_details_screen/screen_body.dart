import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/presentation/cubits/get_season_details/get_season_details_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/season_details_screen/episode_card/episode_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'episodes_list.dart';
part 'overview.dart';
part 'screen_app_bar.dart';
class SeasonDetailsScreenBody extends StatelessWidget {
  const SeasonDetailsScreenBody({
    super.key,
    required this.airDate,
    required this.posterPath,
    required this.seasonName,
  });

  final String airDate;
  final String ?posterPath;
  final String seasonName;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _SeasonScreenAppBar(airDate: airDate, posterPath: posterPath, seasonName: seasonName),
        const _SeasonOverview(),
        const EpisodesList(),
      ],
    );
  }
}