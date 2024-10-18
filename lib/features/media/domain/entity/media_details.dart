import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/movie.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';

abstract class MediaDetails extends Media {
  final List<Keyword> genres;
  final List<Keyword> keywords;
  final List<Network> productionCompanies;
  final Gallery gallery;
  final num runtime;
  final Video trailer;
  final String status;
  final String tagline;
  final String homepage;
  final Credits credits;
  final ImageEntity ?logoPath;
  final MediaAccountDetails mediaAccountDetails;
  final MediaListResponse recommendations;

  const MediaDetails({
    required this.genres,
    required this.keywords,
    required this.productionCompanies,
    required this.gallery,
    required this.runtime,
    required this.logoPath,
    required this.trailer,
    required this.status,
    required this.tagline,
    required this.homepage,
    required this.credits,
    required this.mediaAccountDetails,
    required super.id,
    required super.voteAverage,
    required super.voteCount,
    required super.name,
    required super.posterPath,
    required super.releaseDate,
    required super.originalName,
    required super.backdropPath,
    required super.originalLanguage,
    required super.overview,
    required this.recommendations,
  });

  static MediaDetails emptyMedia(MediaType mediaType) {
    return switch (mediaType) {
      MediaType.movie => Movie(),
      MediaType.tv => TvShow(),
    };
  }
}
extension MovieExtensions on MediaDetails {
  String getRuntime() {
    if (runtime != 0) {
      return "${runtime ~/ 60 == 0 ? '' : '${runtime ~/ 60}h'}"
          " ${runtime % 60 == 0 ? "" : "${runtime % 60}m"}";
    }
    return '';
  }
}