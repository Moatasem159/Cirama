import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';

class SeasonInfo extends StatelessWidget {
  final TvShowSeason season;

  const SeasonInfo({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: const BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            season.name,
            style: context.titleSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(context.screenWidth / 350),
          ),
          Text(
            season.airDate != null
                ? "${season.getAirDate()} | ${context.locale.episodes(season.episodeCount!)}"
                : context.locale.episodes(season.episodeCount!),
            maxLines: null,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: context.labelMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textScaler: TextScaler.linear(context.screenWidth / 370),
          ),
          const VerticalSpace(5),
        ],
      ),
    );
  }
}