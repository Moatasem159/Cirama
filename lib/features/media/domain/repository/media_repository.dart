import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/features/media/data/repository/media_repository_imp.dart';
import 'package:movies_app/features/media/data/sources/media_remote_data_source.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
@lazySingleton
abstract class MediaRepository {
  @factoryMethod
  const factory MediaRepository(NetworkInfo networkInfo,MediaRemoteDataSource mediaRemoteDataSource) = MediaRepositoryImpl;
  Future<ApiResult<MediaListResponse>> getMediaList(MediaListParams params);
  Future<ApiResult<MediaDetails>> getMediaDetails(MediaDetailsParams params);
  Future<ApiResult<TvShowSeason>> getSeasonDetails(SeasonDetailsParams params);
  Future<ApiResult<MessageModel>> mediaActions(MediaActionParams params);
}