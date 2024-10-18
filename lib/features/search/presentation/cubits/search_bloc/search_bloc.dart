import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;

  SearchBloc(this._searchRepository) : super(const SearchInitial()) {
    on<Search>(
      (Search event, Emitter<SearchState> emit) async {
        if (event.query.isEmpty) {
          return add(LocalSearch());
        }
        emit(const SearchLoading());
        final ApiResult<SearchResponse> result = await _searchRepository.search(event.query);
        result.when(
          success: (SearchResponse data) {
            if (data.results.isNotEmpty) {
              emit(SearchSuccess(data: data));
            } else {
              emit(const SearchEmpty());
            }
          },
          failure: (handler) => emit(SearchError(message: handler.message.message)),
        );
      },
      transformer: (Stream<Search> events, EventMapper<Search> mapper) =>
          events.debounceTime(const Duration(milliseconds: 400)).distinct().switchMap(mapper),
    );
    on<LocalSearch>(
      (LocalSearch event, Emitter<SearchState> emit) async {
        final ApiResult<List<SearchEntity>> result = _searchRepository.getLocalSearch();
        result.when(
          success: (List<SearchEntity> data) => emit(LocalSearchSuccess(data: data)),
          failure: (ErrorHandler handler) => emit(const LocalSearchError()),
        );
      },
      transformer: (Stream<LocalSearch> events, EventMapper<LocalSearch> mapper) =>
          events.distinct().switchMap(mapper),
    );
    on<SaveSearch>(
      (SaveSearch event, Emitter<SearchState> emit) async {
        final ApiResult<void> result = await _searchRepository.saveSearch(event.search);
        result.when(
          success: (void data) => emit(const SaveSearchSuccess()),
          failure: (ErrorHandler handler) => emit(const SaveSearchError()),
        );
      },
      transformer: (Stream<SaveSearch> events, EventMapper<SaveSearch> mapper) =>
          events.distinct().switchMap(mapper),
    );
    on<ClearSearch>(
      (ClearSearch event, Emitter<SearchState> emit) async {
        final ApiResult<void> result = await _searchRepository.deleteSearch(event.search);
        result.when(
          success: (void data) => add(LocalSearch()),
          failure: (ErrorHandler handler) => emit(const ClearSearchError()),
        );
      },
      transformer: (Stream<ClearSearch> events, EventMapper<ClearSearch> mapper) =>
          events.distinct().switchMap(mapper),
    );
    on<ClearAllSearch>(
      (ClearAllSearch event, Emitter<SearchState> emit) async {
        final ApiResult<void> result = await _searchRepository.clearAllSearch();
        result.when(
          success: (void data) => add(LocalSearch()),
          failure: (ErrorHandler handler) => emit(const ClearAllSearchError()),
        );
      },
      transformer: (Stream<ClearAllSearch> events, EventMapper<ClearAllSearch> mapper) =>
          events.distinct().switchMap(mapper),
    );
  }
}