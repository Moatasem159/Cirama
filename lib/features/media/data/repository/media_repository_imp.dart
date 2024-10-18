import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/features/media/data/mappers/media_mapper.dart';
import 'package:movies_app/features/media/data/mappers/movie_mapper.dart';
import 'package:movies_app/features/media/data/mappers/tv_show_mapper.dart';
import 'package:movies_app/features/media/data/model/cast_model.dart';
import 'package:movies_app/features/media/data/model/media_details_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/media_model.dart';
import 'package:movies_app/features/media/data/model/movie_model.dart';
import 'package:movies_app/features/media/data/model/tv_show_model.dart';
import 'package:movies_app/features/media/data/sources/media_remote_data_source.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';
class MediaRepositoryImpl implements MediaRepository {
  final NetworkInfo _networkInfo;
  final MediaRemoteDataSource _mediaRemoteDataSource;
  const MediaRepositoryImpl(this._networkInfo, this._mediaRemoteDataSource);
  @override
  Future<ApiResult<MediaListResponse>> getMediaList(MediaListParams params) async {
    if (await _networkInfo.isConnected) {
      try {
        final MediaListResponseModel response = await _mediaRemoteDataSource.getMediaList(
            params.page, params.listType.title, params.mediaType.name);
        response.mediaList.removeWhere(
            (MediaModel element) => element.backdropPath.isEmpty || element.posterPath.isEmpty);
        final MediaListResponse result =
            MediaMapper.mediaListResponseModelToMediaListResponse(response);
        return ApiResult.success(result);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
  }
  @override
  Future<ApiResult<MediaDetails>> getMediaDetails(MediaDetailsParams params) async {
    if (!(await _networkInfo.isConnected)) {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
    try {
      final MediaDetailsResponseModel response = await _mediaRemoteDataSource.getMediaDetails(
        params.mediaType.name,
        params.mediaId,
      );
      response.mediaDetails.credits.crew
          .removeWhere((CastMemberModel element) => element.profilePath == null);
      response.mediaDetails.recommendations.mediaList.removeWhere(
          (MediaModel element) => element.backdropPath.isEmpty || element.posterPath.isEmpty);
      final MediaDetails media = response.mediaDetails is MovieModel
          ? MovieMapper.movieModelToMovie(response.mediaDetails as MovieModel)
          : TvShowMapper.tvShowModelToTvShow(response.mediaDetails as TvShowModel);
      return ApiResult.success(media);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  Future<ApiResult<TvShowSeason>> getSeasonDetails(SeasonDetailsParams params) async {
    if (!(await _networkInfo.isConnected)) {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
    try {
      final TvShowSeasonModel response =
          await _mediaRemoteDataSource.getSeasonDetails(params.seasonNumber, params.mediaId.toString());
      final TvShowSeason result = TvShowMapper.seasonModelToSeason(response);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  Future<ApiResult<MessageModel>> mediaActions(MediaActionParams params) async {
    if (!(await _networkInfo.isConnected)) {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
    try {
      if (params.actionType != 'deleteRating') {
        final MessageModel response = await _mediaRemoteDataSource.mediaAction(
          params.mediaType.name,
          params.mediaId,
          params.actionType,
          params.actionType == "rating"
              ? {"value": params.ratingValue}
              : {
                  "media_type": params.mediaType.name,
                  "media_id": params.mediaId,
                  params.actionType: params.actionValue
                },
        );
        return ApiResult.success(response);
      } else {
        final MessageModel response = await _mediaRemoteDataSource.deleteRate(
          params.mediaType.name,
          params.mediaId,
          params.actionType,
        );
        return ApiResult.success(response);
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}