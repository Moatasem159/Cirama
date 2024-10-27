import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';
@lazySingleton
class GetMediaListUseCase {
  final MediaRepository _mediaRepository;
  GetMediaListUseCase(this._mediaRepository);
  Future<ApiResult<MediaListResponse>> call(MediaListParams params) async =>
      await _mediaRepository.getMediaList(params);
}