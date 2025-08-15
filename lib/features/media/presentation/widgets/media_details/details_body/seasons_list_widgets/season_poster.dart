import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/seasons_list_widgets/season_info.dart' show SeasonInfo;
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/seasons_list_widgets/season_poster_image.dart';

class SeasonPoster extends StatelessWidget {
  final TvShowSeason season;
  final int tvShowId;
  final String tvShowName;

  const SeasonPoster({
    super.key,
    required this.season,
    required this.tvShowId,
    required this.tvShowName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => SeasonDetailsRoute(
          airDate: season.getAirDate(),
          seasonNumber: season.seasonNumber,
          tvShowId: tvShowId,
          seasonName: season.name,
          posterPath: season.posterPath,
        ).push(context),
        child: Column(
          spacing: 5,
          children: [
            SeasonPosterImage(image: season.posterPath),
            SeasonInfo(season: season),
          ],
        ),
      ),
    );
  }
}