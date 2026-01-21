import 'package:movies_app/core/extensions/list_extension.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';
import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
abstract class MediaMapper {
  static MediaListResponse mediaListResponseModelToMediaListResponse(MediaListResponseModel model) {
    return MediaListResponse(
      page: model.page,
      totalPages: model.totalPages,
      totalResults: model.totalResults,
      mediaList: model.mediaList.map((MediaListItemModel media) => mediaListItemModelToMediaListItem(media)).toList(),
    );
  }

  static MediaListItem mediaListItemModelToMediaListItem(MediaListItemModel model) {
    return MediaListItem(
      id: model.id,
      voteAverage: model.voteAverage,
      name: model.name,
      voteCount: model.voteCount,
      overview: model.overview,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate??'',
      originalName: model.originalName,
      backdropPath: model.backdropPath,
      originalLanguage: model.originalLanguage,
    );
  }

  static Gallery galleryModelToGallery(GalleryModel model) {
    return Gallery(
      backdrops: model.backdrops
          .map((ImageModel backdrop) => imageModelToImage(backdrop))
          .toList(),
      posters: model.posters
          .map((ImageModel posters) => imageModelToImage(posters))
          .toList(),
      logos: model.logos
          .map((ImageModel logos) => imageModelToImage(logos))
          .toList(),
    );
  }

  static ImageEntity imageModelToImage(ImageModel model) {
    return ImageEntity(
      aspectRatio: model.aspectRatio,
      height: model.height,
      langCode: model.langCode,
      filePath: model.filePath,
      width: model.width,
    );
  }

  static ImageEntity? getLogoPath(List<ImageModel> logos, String originalLanguage) {
    if (logos.isEmpty) {
      return null;
    }
    bool isSvg(ImageModel element) => element.filePath.endsWith('.svg');

    ImageModel? logo = logos.firstWhereOrNull(
          (ImageModel element) => element.langCode == AppConstants.appLanguage && !isSvg(element),
    );
    logo ??= logos.firstWhereOrNull(
          (ImageModel element) => element.langCode ==originalLanguage && !isSvg(element),
    );
    logo ??= logos.firstWhereOrNull(
          (ImageModel element) => element.langCode == 'null' && !isSvg(element),
    );

    logo ??= logos.firstWhereOrNull((ImageModel element) => !isSvg(element));

    logo ??= logos.firstWhereOrNull(
          (ImageModel element) => element.langCode == originalLanguage && isSvg(element),
    );
    logo ??= logos.firstWhereOrNull(
          (ImageModel element) => element.langCode == 'null' && isSvg(element),
    );
    logo ??= logos.firstWhereOrNull((element) => isSvg(element));

    logo ??= logos.first;

    return imageModelToImage(logo);
  }


  static Keyword keywordModelToKeyword(KeywordModel keyword) {
    return Keyword(id: keyword.id, name: keyword.name);
  }

  static Network networkModelToNetwork(NetworkModel network) {
    return Network(
      id: network.id,
      name: network.name,
      logoPath: network.logoPath,
    );
  }

  static Video videoModelToVideo(List<VideoModel> videos) {
    if (videos.isEmpty) {
      return Video(
          name: "null",
          key: '',
          site: "",
          type: "",
          official: false,
          publishedAt: "",
          id: "");
    }
    for (VideoModel element in videos) {
      if (element.name == "Official Trailer" ||
          element.name == "Official Teaser" ||
          element.type == "Trailer") {
        return Video(
          name: element.name,
          key: element.key,
          site: element.site,
          type: element.type,
          official: element.official,
          publishedAt: element.publishedAt,
          id: element.id,
        );
      }
    }
    return Video(
      name: videos.first.name,
      key: videos.first.key,
      site: videos.first.site,
      type: videos.first.type,
      official: videos.first.official,
      publishedAt: videos.first.publishedAt,
      id: videos.first.id,
    );
  }

  static CastMember castMemberModelToCastMember(CastMemberModel model) {
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

  static Credits creditsModelToCredits(CreditsModel model) {
    return Credits(
      cast: model.cast
          .map((CastMemberModel cast) => castMemberModelToCastMember(cast))
          .toList(),
      crew: model.crew
          .map((CastMemberModel cast) => castMemberModelToCastMember(cast))
          .toList(),
    );
  }

  static MediaAccountDetails mediaAccountDetailsModelToMediaAccountDetails(MediaAccountDetailsModel model) {
    return MediaAccountDetails(
      favorite: model.favorite,
      ratedValue: model.ratedValue,
      watchlist: model.watchlist,
    );
  }
}

abstract class MediaModelMapper {
  static MediaListResponseModel mediaListResponseToMediaListResponseModel(
      MediaListResponse mediaListResponse) {
    return MediaListResponseModel(
      page: mediaListResponse.page,
      totalPages: mediaListResponse.totalPages,
      totalResults: mediaListResponse.totalResults,
      mediaList: mediaListResponse.mediaList
          .map(
              (MediaListItem media) => mediaListItemToMediaListItemModel(media))
          .toList(),
    );
  }

  static MediaListItemModel mediaListItemToMediaListItemModel(MediaListItem media) {
    return MediaListItemModel(
      id: media.id,
      name: media.name,
      overview: media.overview,
      voteCount: media.voteCount,
      voteAverage: media.voteAverage,
      posterPath: media.posterPath,
      releaseDate: media.releaseDate,
      originalName: media.originalName,
      backdropPath: media.backdropPath,
      originalLanguage: media.originalLanguage,
    );
  }
}