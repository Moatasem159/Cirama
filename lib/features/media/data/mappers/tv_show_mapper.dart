import 'package:movies_app/features/media/data/mappers/media_mapper.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';
import 'package:movies_app/features/media/data/model/tv_show_model.dart';
import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';

abstract class TvShowMapper {
  static TvShow tvShowModelToTvShow(TvShowModel model) {
    return TvShow(
      voteCount: model.voteCount,
      gallery: MediaMapper.galleryModelToGallery(model.images),
      logoPath: MediaMapper.getLogoPath(model.images.logos, model.originalLanguage),
      id: model.id,
      type: model.type,
      lastAirDate: model.lastAirDate??'',
      numberOfSeasons: model.numberOfSeasons,
      numberOfEpisodes: model.numberOfEpisodes,
      runtime: model.episodeRunTime.isNotEmpty ? model.episodeRunTime[0] : 0,
      voteAverage: model.voteAverage,
      name: model.name,
      status: model.status,
      tagline: model.tagline,
      overview: model.overview,
      homepage: model.homepage,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate??'',
      originalName: model.originalName,
      backdropPath: model.backdropPath,
      originalLanguage: model.originalLanguage,
      seasons: model.seasons
          .where((TvShowSeasonModel season) =>
              season.name != "Specials" && season.name != "العروض الخاصة")
          .map((TvShowSeasonModel season) => seasonModelToSeason(season))
          .toList(),
      genres: model.genres
          .map((KeywordModel genre) => MediaMapper.keywordModelToKeyword(genre))
          .toList(),
      keywords: model.keywords
          .map((KeywordModel keyword) => MediaMapper.keywordModelToKeyword(keyword))
          .toList(),
      productionCompanies: model.productionCompanies
          .map((NetworkModel network) => MediaMapper.networkModelToNetwork(network))
          .toList(),
      trailer: MediaMapper.videoModelToVideo(model.videos),
      mediaAccountDetails:
          MediaMapper.mediaAccountDetailsModelToMediaAccountDetails(model.mediaAccountDetails),
      credits: MediaMapper.creditsModelToCredits(model.credits),
      recommendations: MediaMapper.mediaListResponseModelToMediaListResponse(model.recommendations),
    );
  }

  static TvShowSeason seasonModelToSeason(TvShowSeasonModel model) {
    return TvShowSeason(
      airDate: model.airDate,
      episodeCount: model.episodeCount,
      id: model.id,
      episodes:
          model.episodes?.map((EpisodeModel episode) => _episodeModelToEpisode(episode)).toList() ??
              [],
      name: model.name,
      overview: model.overview,
      posterPath: model.posterPath,
      seasonNumber: model.seasonNumber,
    );
  }

  static Episode _episodeModelToEpisode(EpisodeModel episode) {
    return Episode(
      airDate: episode.airDate,
      episodeNumber: episode.episodeNumber,
      id: episode.id,
      name: episode.name,
      overview: episode.overview,
      runtime: episode.runtime,
      seasonNumber: episode.seasonNumber,
      showId: episode.showId,
      stillPath: episode.stillPath,
      crew: episode.crew
          .map((CastMemberModel castMember) => _castMemberModelToCastMember(castMember))
          .toList(),
      guestStars: episode.guestStars
          .map((CastMemberModel castMember) => _castMemberModelToCastMember(castMember))
          .toList(),
    );
  }

  static CastMember _castMemberModelToCastMember(CastMemberModel model) {
    return CastMember(
      id: model.id,
      gender: model.gender,
      knownForDepartment: model.knownForDepartment,
      name: model.name,
      originalName: model.originalName,
      profilePath: model.profilePath,
      castId: model.castId,
      character: model.character,
      creditId: model.creditId,
      order: model.order,
      department: model.department,
      job: model.job,
    );
  }
}