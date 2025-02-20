import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/search/data/models/search_response_model.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';

abstract class SearchMapper {
  static SearchResponse toSearchResponse(SearchResponseModel model) {
    return SearchResponse(
      page: model.page,
      results: model.results
          .where((SearchModel e) =>
              (e is MediaSearchModel && e.backdropPath.isNotEmpty && e.profilePath.isNotEmpty) ||
              (e is PersonSearchModel && e.profilePath.isNotEmpty))
          .map((SearchModel e) => toEntity(e))
          .toList(),
      totalResults: model.totalResults,
      totalPages: model.totalPages,
    );
  }

  static SearchEntity toEntity(SearchModel model) {
    switch (model.mediaType) {
      case 'movie'||"tv":
        final MediaSearchModel mediaModel = model as MediaSearchModel;
        return MediaSearch(
          overview: mediaModel.overview,
          backdropPath: mediaModel.backdropPath,
          id: mediaModel.id,
          mediaType: mediaModel.mediaType=="movie"?SearchType.movie:SearchType.tv,
          name: mediaModel.name,
          originalName: mediaModel.originalName,
          releaseDate: mediaModel.releaseDate,
          profilePath: mediaModel.profilePath,
        );
      case 'person':
        final PersonSearchModel personModel = model as PersonSearchModel;
        return PersonSearch(
          department: personModel.department,
          knownFor: personModel.knownFor.map((e) => toEntity(e)).toList(),
          id: personModel.id,
          mediaType: SearchType.person,
          name: personModel.name,
          originalName: personModel.originalName,
          releaseDate: personModel.releaseDate,
          profilePath: personModel.profilePath,
        );
      default:
        throw UnimplementedError("Unsupported media type");
    }
  }

  static SearchResponseModel fromSearchResponse(SearchResponse response) {
    return SearchResponseModel(
      page: response.page,
      results: response.results.map((SearchEntity e) => fromEntity(e)).toList(),
      totalResults: response.totalResults,
      totalPages: response.totalPages,
    );
  }

  static SearchModel fromEntity(SearchEntity entity) {
    switch (entity.mediaType) {
      case SearchType.movie||SearchType.tv:
        return MediaSearchModel(
          overview: (entity as MediaSearch).overview,
          backdropPath: entity.backdropPath,
          id: entity.id,
          mediaType: entity.mediaType==SearchType.movie?"movie":"tv",
          name: entity.name,
          originalName: entity.originalName,
          releaseDate: entity.releaseDate,
          profilePath: entity.profilePath,
        );
      case SearchType.person:
        return PersonSearchModel(
          department: (entity as PersonSearch).department,
          knownFor: entity.knownFor.map((SearchEntity e) => fromEntity(e)).toList(),
          id: entity.id,
          mediaType: 'person',
          name: entity.name,
          originalName: entity.originalName,
          releaseDate: entity.releaseDate,
          profilePath: entity.profilePath,
        );
    }
  }
}