import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';

part 'get_media_detail_state.dart';
class GetMediaDetailCubit extends Cubit<GetMediaDetailState> {
  final MediaDetailsParams params;
  final ListType listType;
  final MediaRepository _mediaRepository;
  GetMediaDetailCubit(this._mediaRepository, this.params, this.listType) : super(const GetMediaDetailInitial());
  Future<void> getMediaDetails() async {
    emit(const GetMediaDetailLoading());
    final ApiResult<MediaDetails> result = await _mediaRepository.getMediaDetails(params);
    result.when(
      success: (MediaDetails data) => emit(GetMediaDetailSuccess(mediaDetails: data)),
      failure: (ErrorHandler handler) => emit(GetMediaDetailError(message: handler.message.message)),
    );
  }
}