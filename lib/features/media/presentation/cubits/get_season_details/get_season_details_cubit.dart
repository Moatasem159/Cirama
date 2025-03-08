import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';

part 'get_season_details_state.dart';
class GetSeasonDetailsCubit extends Cubit<GetSeasonDetailsState> {
  final SeasonDetailsParams _params;
  final MediaRepository _mediaRepository;
  GetSeasonDetailsCubit(this._params, this._mediaRepository) : super(const GetSeasonDetailsLoading());
  Future<void> getSeasonDetails() async {
    final ApiResult<TvShowSeason> result = await _mediaRepository.getSeasonDetails(_params);
    result.when(
      success: (TvShowSeason data) => emit(GetSeasonDetailsSuccess(data)),
      failure: (ErrorHandler handler) => emit(GetSeasonDetailsError(handler.message.message)),
    );
  }
}