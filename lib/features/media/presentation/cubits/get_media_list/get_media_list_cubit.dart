import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/media/data/mappers/media_mapper.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';

part 'get_media_list_state.dart';
class GetMediaListCubit extends HydratedCubit<GetMediaListState> {
  final MediaListParams params;
  final MediaRepository _mediaRepository;
  GetMediaListCubit(this._mediaRepository, this.params) : super(const GetMediaListInitial());
  Future<void> getMediaList() async {
    if (state is! GetMediaListSuccess) {
      emit(const GetMediaListLoading());
      final ApiResult<MediaListResponse> result = await _mediaRepository.getMediaList(params);
      result.when(
        success: (MediaListResponse data) => emit(GetMediaListSuccess(
            media: data, time: DateTime.now().toIso8601String(), local: AppConstants.appLanguage,)),
        failure: (ErrorHandler handler) => emit(GetMediaListError(handler.message.message)),
      );
    }
  }
  @override
  String get id => "${params.mediaType}${params.listType}";
  @override
  GetMediaListState? fromJson(Map<String, dynamic> json) {
    if (json['local'] == AppConstants.appLanguage &&
        DateTime.now().difference(DateTime.parse(json["time"])).inHours < 5) {
      return GetMediaListSuccess.fromJson(json);
    } else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(GetMediaListState state) {
    if (state is GetMediaListSuccess) {
      return state.toJson();
    } else {
      return null;
    }
  }
}