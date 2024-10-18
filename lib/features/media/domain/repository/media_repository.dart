import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
abstract class MediaRepository {
  Future<ApiResult<MediaListResponse>> getMediaList(MediaListParams params);
  Future<ApiResult<MediaDetails>> getMediaDetails(MediaDetailsParams params);
  Future<ApiResult<TvShowSeason>> getSeasonDetails(SeasonDetailsParams params);
  Future<ApiResult<MessageModel>> mediaActions(MediaActionParams params);
}