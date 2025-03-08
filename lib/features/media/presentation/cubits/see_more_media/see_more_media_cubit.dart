import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';

part 'see_more_media_state.dart';
class SeeMoreMediaCubit extends Cubit<SeeMoreMediaState> {
  final MediaListParams params;
  final MediaRepository _mediaRepository;
  SeeMoreMediaCubit(this.params, this._mediaRepository) : super(const SeeMoreMediaInitial());
  late MediaListResponse mediaListResponse;
  Future<void> getMediaList() async {
    if (state is LastPage) return;
    if (state is SeeMoreMediaLoading) return;
    if (mediaListResponse.page >= mediaListResponse.totalPages) {
      emit(const LastPage());
      return;
    }
    emit(const SeeMoreMediaLoading());
    final MediaListParams params = this.params.copyWith(page: mediaListResponse.page + 1);
    final ApiResult<MediaListResponse> result = await _mediaRepository.getMediaList(params);
    result.when(
      success: (MediaListResponse data) {
        mediaListResponse = mediaListResponse.copyWith(
            page: data.page,
            totalPages: data.totalPages,
            totalResults: data.totalResults,
            mediaList: [...mediaListResponse.mediaList, ...data.mediaList]);
        emit(const SeeMoreMediaSuccess());
      },
      failure: (ErrorHandler handler) => emit(SeeMoreMediaError(message: handler.message.message)),
    );
  }
}