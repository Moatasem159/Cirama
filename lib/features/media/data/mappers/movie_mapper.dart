import 'package:movies_app/features/media/data/mappers/media_mapper.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';
import 'package:movies_app/features/media/data/model/movie_model.dart';
import 'package:movies_app/features/media/domain/entity/movie.dart';
abstract class MovieMapper {
  static Movie movieModelToMovie(MovieModel model) {
    return Movie(
      credits: MediaMapper.creditsModelToCredits(model.credits),
      voteCount: model.voteCount,
      budget: model.budget,
      revenue: model.revenue,
      runtime: model.runtime,
      id: model.id,
      voteAverage: model.voteAverage,
      name: model.name,
      status: model.status,
      tagline: model.tagline,
      overview: model.overview,
      homepage: model.homepage,
      posterPath: model.posterPath,
      logoPath:MediaMapper.getLogoPath(model.images.logos, model.originalLanguage),
      releaseDate: model.releaseDate??'',
      originalName: model.originalName,
      backdropPath: model.backdropPath,
      originalLanguage: model.originalLanguage,
      genres: model.genres.map((KeywordModel genre) => MediaMapper.keywordModelToKeyword(genre)).toList(),
      keywords: model.keywords.map((KeywordModel keyword) => MediaMapper.keywordModelToKeyword(keyword)).toList(),
      productionCompanies: model.productionCompanies.map((NetworkModel network) =>  MediaMapper.networkModelToNetwork(network)).toList(),
      trailer: MediaMapper.videoModelToVideo(model.videos),
      mediaAccountDetails: MediaMapper.mediaAccountDetailsModelToMediaAccountDetails(model.mediaAccountDetails),
      gallery: MediaMapper.galleryModelToGallery(model.images),
      recommendations: MediaMapper.mediaListResponseModelToMediaListResponse(model.recommendations),
    );
  }
}