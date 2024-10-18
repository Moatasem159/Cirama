import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'media_actions_events.dart';
part 'media_actions_state.dart';

class MediaActionsBloc extends Bloc<MediaActionsEvents, MediaActionsState> {
  final MediaRepository _mediaRepository;
  final ListType listType;
  final MediaDetailsParams params;
  late MediaAccountDetails mediaAccountDetails;
  late MediaListItem mediaDetails;
  MediaActionsBloc(this._mediaRepository, this.params, this.listType) : super(const MediaActionsInitial()) {
    on<RateMediaEvent>((RateMediaEvent event, Emitter<MediaActionsState> emit) => rateMedia(emit),
        transformer: (Stream<RateMediaEvent> eventsStream, EventMapper<RateMediaEvent> mapper) =>
            eventsStream.distinct().switchMap(mapper));
    on<DeleteRateMediaEvent>(
      (DeleteRateMediaEvent event, Emitter<MediaActionsState> emit) => deleteRateMedia(emit),
      transformer:
          (Stream<DeleteRateMediaEvent> eventsStream, EventMapper<DeleteRateMediaEvent> mapper) =>
              eventsStream.distinct().switchMap(mapper),
    );
    on<FavMediaEvent>((FavMediaEvent event, Emitter<MediaActionsState> emit) => favMedia(emit),
        transformer: (Stream<FavMediaEvent> eventsStream, EventMapper<FavMediaEvent> mapper) =>
            eventsStream.distinct().switchMap(mapper));
    on<WatchListMediaEvent>(
        (WatchListMediaEvent event, Emitter<MediaActionsState> emit) => addMediaToWatchList(emit),
        transformer:
            (Stream<WatchListMediaEvent> eventsStream, EventMapper<WatchListMediaEvent> mapper) =>
                eventsStream.distinct().switchMap(mapper));
  }
  Future<void> favMedia(Emitter<MediaActionsState> emit) async {
    emit(const FavoriteLoading());
    mediaAccountDetails = mediaAccountDetails.copyWith(favorite: !mediaAccountDetails.favorite);
    ApiResult<MessageModel> result = await _mediaRepository.mediaActions(
      MediaActionParams(
        mediaId: params.mediaId,
        mediaType: params.mediaType,
        actionValue: mediaAccountDetails.favorite,
        actionType: 'favorite',
      ),
    );
    result.when(
      success: (MessageModel value) => emit(const FavoriteSuccess()),
      failure: (ErrorHandler value) {
        mediaAccountDetails = mediaAccountDetails.copyWith(favorite: !mediaAccountDetails.favorite);
        emit(const FavoriteError());
      },
    );
  }

  Future<void> addMediaToWatchList(Emitter<MediaActionsState> emit) async {
    emit(const WatchlistLoading());
    mediaAccountDetails = mediaAccountDetails.copyWith(watchlist: !mediaAccountDetails.watchlist);
    ApiResult<MessageModel> result = await _mediaRepository.mediaActions(
      MediaActionParams(
          mediaId: params.mediaId,
          mediaType: params.mediaType,
          actionType: 'watchlist',
          actionValue: mediaAccountDetails.watchlist),
    );
    result.when(
      success: (MessageModel value) => emit(const WatchlistSuccess()),
      failure: (ErrorHandler value) {
        mediaAccountDetails =
            mediaAccountDetails.copyWith(watchlist: !mediaAccountDetails.watchlist);
        emit(const WatchlistError());
      },
    );
  }

  double? lastRate;

  Future<void> rateMedia(Emitter<MediaActionsState> emit) async {
    if (lastRate != null) {
      emit(const RateLoading());
      ApiResult<MessageModel> result = await _mediaRepository.mediaActions(
        MediaActionParams(
          ratingValue: mediaAccountDetails.ratedValue.toDouble(),
          mediaId: params.mediaId,
          mediaType: params.mediaType,
          actionType: 'rating',
        ),
      );
      result.when(
        success: (MessageModel value) {
          lastRate = null;
          emit(const RateSuccess());
        },
        failure: (ErrorHandler value) {
          getLastRate();
          emit(const RateError());
        },
      );
    }
  }

  updateRateValue(double value) {
    if (lastRate == null) {
      saveLastRate();
    }
    mediaAccountDetails = mediaAccountDetails.copyWith(ratedValue: value);
  }

  saveLastRate() {
    lastRate = mediaAccountDetails.ratedValue.toDouble();
  }

  getLastRate() {
    mediaAccountDetails = mediaAccountDetails.copyWith(ratedValue: lastRate);
    lastRate = null;
  }

  Future<void> deleteRateMedia(Emitter<MediaActionsState> emit) async {
    emit(const RateLoading());
    ApiResult<MessageModel> result = await _mediaRepository.mediaActions(
      MediaActionParams(
        ratingValue: mediaAccountDetails.ratedValue.toDouble(),
        mediaId: params.mediaId,
        mediaType: params.mediaType,
        actionType: 'deleteRating',
      ),
    );
    result.when(
      success: (MessageModel value) => emit(const DeleteRateSuccess()),
      failure: (ErrorHandler value) {
        getLastRate();
        emit(const RateError());
      },
    );
  }
}