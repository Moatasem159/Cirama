import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';

class TvShow extends MediaDetails {
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final String type;
  final String lastAirDate;
  final List<TvShowSeason> seasons;

  const TvShow({
    this.numberOfSeasons = 0,
    this.numberOfEpisodes = 0,
    this.type = '',
    this.lastAirDate = '',
    this.seasons = const [],
    super.id = 0,
    super.voteAverage = 0.0,
    super.voteCount = 0,
    super.name = "empty name",
    super.overview = 'ghdhjks,dshow hdbnmksdnbhgsvf wsdknsbvgdvsbh n fjwhbcjnskcjn',
    super.posterPath = '',
    super.releaseDate = '00000-00-00',
    super.originalName = "empty original name",
    super.backdropPath = '',
    super.tagline = 'this is tagline',
    super.originalLanguage = '',
    super.runtime = 0,
    super.status = 'released kskskd',
    super.homepage = '',
    super.genres = const [
      Keyword(),
      Keyword(),
      Keyword(),
    ],
    super.keywords = const [],
    super.productionCompanies = const [],
    super.gallery = const Gallery(),
    super.logoPath = const ImageEntity(),
    super.trailer = const Video(),
    super.credits = const Credits(),
    super.mediaAccountDetails = const MediaAccountDetails(),
    super.recommendations = const MediaListResponse(),
  });
}

class TvShowSeason {
  final String? airDate;
  final int? episodeCount;
  final int id;
  final List<Episode>? episodes;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;

  const TvShowSeason({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    this.episodes,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  static TvShowSeason emptySeason() {
    return TvShowSeason(
      airDate: '2008-01-20',
      episodeCount: 7,
      id: 1,
      name: 'Season 1',
      overview:
          'dfghjkuytrefghjkjdhgfdertyuilkmnbvdertyuiknbvfdrtyujdfdgghhgfdfghjkjhtrtyukdhvbdjcndugysgdsidjusgdstfdsujdwslkdsydfsdhjksdlsjudgfywsgdhjsdlkwshydtg',
      posterPath: '',
      seasonNumber: 0,
      episodes: [],
    );
  }
}

extension TvShowSeasonExtensions on TvShowSeason {
  String getAirDate() {
    return airDate != null ? "(${airDate!.substring(0, 4)})" : '';
  }
}

class Episode {
  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final int? runtime;
  final int seasonNumber;
  final int showId;
  final String? stillPath;
  final List<CastMember> crew;
  final List<CastMember> guestStars;

  const Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.crew,
    required this.guestStars,
  });

  static Episode emptyEpisode() {
    return Episode(
      airDate: 'sndgsdvhwsbmd,,lmnsbhgvbhn',
      episodeNumber: 0,
      id: 0,
      name: 'rdfghjkl;lkjehgfdghjk,',
      overview: 'shgdfgshjk,jhdgfgvbhnjhgdfghjk,ljnhgfcdsdfghjklkjhgtfrdesdfghjkl,kjnhgfdsfghjk',
      runtime: 0,
      seasonNumber: 0,
      showId: 0,
      stillPath: '',
      crew: [],
      guestStars: [],
    );
  }
}

extension EpisodeExtensions on Episode {
  String getRuntime() {
    return runtime != null
        ? "${runtime! ~/ 60 > 0 ? "${runtime! ~/ 60} h " : ''}${runtime! % 60 == 0 ? '' : "${runtime! % 60} m"}"
        : '';
  }
}