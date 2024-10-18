import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/presentation/cubits/get_season_details/get_season_details_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/season_details_screen/screen_body.dart';

class SeasonDetailsScreen extends StatelessWidget {
  final int tvShowId;
  final int seasonNumber;
  final String? posterPath;
  final String seasonName;
  final String airDate;

  const SeasonDetailsScreen({
    super.key,
    required this.tvShowId,
    required this.seasonNumber,
    required this.posterPath,
    required this.seasonName,
    required this.airDate,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetSeasonDetailsCubit(
        SeasonDetailsParams(
          mediaType: MediaType.tv,
          mediaId: tvShowId,
          seasonNumber: seasonNumber,
        ),
        GetIt.I.get(),
      )..getSeasonDetails(),
      child: Scaffold(
        body: SeasonDetailsScreenBody(
          airDate: airDate,
          posterPath: posterPath,
          seasonName: seasonName,
        ),
      ),
    );
  }
}