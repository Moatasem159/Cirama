import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';

class SeasonInfo extends StatelessWidget {
  final TvShowSeason season;

  const SeasonInfo({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            "${season.name} ",
            maxLines: null,
            style: context.titleSmall.copyWith(fontWeight: FontWeight.w600),
            textScaler: TextScaler.linear(context.screenWidth / 350),
          ),
          Text(
            context.locale.episodes(season.episodeCount!),
            overflow: TextOverflow.visible,
            style: context.labelMedium.copyWith(fontWeight: FontWeight.w600),
            textScaler: TextScaler.linear(context.screenWidth / 350),
          ),
          Text(
            season.getAirDate(),
            overflow: TextOverflow.visible,
            style: context.labelMedium.copyWith(fontWeight: FontWeight.w500),
            textScaler: TextScaler.linear(context.screenWidth / 350),
          ),
        ],
      ),
    );
  }
}