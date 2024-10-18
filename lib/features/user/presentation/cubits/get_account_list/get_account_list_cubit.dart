import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/usecase/get_media_list_usecase.dart';

part 'get_account_list_state.dart';

class GetAccountListCubit extends Cubit<GetAccountListState> {
  final MediaListParams params;
  final GetMediaListUseCase _getMediaListUseCase;

  GetAccountListCubit(this._getMediaListUseCase, this.params)
      : super(const GetAccountListInitial());
  MediaListResponse mediaListResponse = MediaListResponse(page: 0, totalPages: 1);

  Future<void> getMediaList() async {
    if (state is LastPage) return;
    if (state is GetAccountListLoading) return;
    if (mediaListResponse.page >= mediaListResponse.totalPages) {
      emit(const LastPage());
      return;
    }
    emit(GetAccountListLoading(mediaListResponse.page == 0 ? true : false));
    final MediaListParams params = this.params.copyWith(page: mediaListResponse.page + 1);
    final ApiResult<MediaListResponse> result = await _getMediaListUseCase(params);
    result.when(
      success: (MediaListResponse data) {
        mediaListResponse = mediaListResponse.copyWith(
            page: data.page,
            totalPages: data.totalPages,
            totalResults: data.totalResults,
            mediaList: [...mediaListResponse.mediaList, ...data.mediaList]);
        emit(const GetAccountListSuccess());
      },
      failure: (ErrorHandler handler) =>
          emit(GetAccountListError(message: handler.message.message)),
    );
  }

  updateList(bool remove, MediaListItem item) {
    {
      if (remove) {
        mediaListResponse.mediaList.removeWhere((MediaListItem element) => element.id == item.id);
      } else {
        bool itemExists = mediaListResponse.mediaList.any((MediaListItem element) => element.id == item.id);
        if (!itemExists) {
          mediaListResponse.mediaList.add(item);
        }
      }
      emit(GetAccountListSuccess());
    }
  }
}