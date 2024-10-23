import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';
import 'package:rxdart/rxdart.dart';

// Import event and state definitions
part 'search_event.dart';
part 'search_state.dart';

/// The [SearchBloc] class is responsible for managing the state of the search feature
/// in the application. It handles various search-related events, interacts with the
/// [SearchRepository] to fetch data, and emits corresponding states based on the results.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository; // Repository for handling search data
  CancelToken? _cancelToken; // Token for cancelling ongoing API requests

  /// Creates an instance of [SearchBloc] with the provided [searchRepository].
  /// Initializes the bloc with an initial state of [SearchInitial].
  SearchBloc(this._searchRepository) : super(const SearchInitial()) {
    // Register event handlers with appropriate transformers
    on<Search>(_onSearch, transformer: _debounceTransformer());
    on<LocalSearch>(_onLocalSearch);
    on<SaveSearch>(_onSaveSearch);
    on<ClearSearch>(_onClearSearch);
    on<ClearAllSearch>(_onClearAllSearch);
  }

  /// Handles the [Search] event.
  /// Cancels any previous search request and initiates a new search if the query is not empty.
  /// Emits [SearchLoading] while searching and either [SearchSuccess], [SearchEmpty],
  /// or [SearchError] based on the result.
  Future<void> _onSearch(Search event, Emitter<SearchState> emit) async {
    _cancelPreviousRequest(); // Cancel previous requests
    _cancelToken = CancelToken(); // Create a new cancel token

    // If the search query is empty, trigger a local search
    if (event.query.isEmpty) {
      return _onLocalSearch(LocalSearch(), emit);
    }

    emit(const SearchLoading()); // Emit loading state
    final ApiResult<SearchResponse> result =
    await _searchRepository.search(event.query, _cancelToken!); // Fetch search results

    result.when(
      success: (SearchResponse data) {
        // Emit success state based on the results
        if (data.results.isNotEmpty) {
          emit(SearchSuccess(data: data));
        } else {
          emit(const SearchEmpty()); // Emit empty state if no results found
        }
      },
      failure: (ErrorHandler handler) =>
          emit(SearchError(message: handler.message.message)), // Emit error state
    );
  }

  /// Handles the [LocalSearch] event.
  /// Fetches local search results from the repository and emits either
  /// [LocalSearchSuccess] or [LocalSearchError] based on the result.
  Future<void> _onLocalSearch(LocalSearch event, Emitter<SearchState> emit) async {
    final ApiResult<List<SearchEntity>> result = _searchRepository.getLocalSearch();
    result.when(
      success: (List<SearchEntity> data) => emit(LocalSearchSuccess(data: data)), // Emit success with local data
      failure: (ErrorHandler handler) => emit(const LocalSearchError()), // Emit error state for local search
    );
  }

  /// Handles the [SaveSearch] event.
  /// Saves the provided search in the repository and emits either
  /// [SaveSearchSuccess] or [SaveSearchError] based on the result.
  Future<void> _onSaveSearch(SaveSearch event, Emitter<SearchState> emit) async {
    final ApiResult<void> result = await _searchRepository.saveSearch(event.search);
    result.when(
      success: (_) => emit(const SaveSearchSuccess()), // Emit success state
      failure: (ErrorHandler handler) => emit(const SaveSearchError()), // Emit error state
    );
  }

  /// Handles the [ClearSearch] event.
  /// Deletes the specified search from the repository and triggers a local search
  /// after successful deletion.
  Future<void> _onClearSearch(ClearSearch event, Emitter<SearchState> emit) async {
    final ApiResult<void> result = await _searchRepository.deleteSearch(event.search);
    result.when(
      success: (_) => add(LocalSearch()), // Trigger local search after clearing
      failure: (ErrorHandler handler) => emit(const ClearSearchError()), // Emit error state
    );
  }

  /// Handles the [ClearAllSearch] event.
  /// Clears all saved searches from the repository and triggers a local search
  /// after successful clearance.
  Future<void> _onClearAllSearch(ClearAllSearch event, Emitter<SearchState> emit) async {
    final ApiResult<void> result = await _searchRepository.clearAllSearch();

    result.when(
      success: (_) => add(LocalSearch()), // Trigger local search after clearing all
      failure: (ErrorHandler handler) => emit(const ClearAllSearchError()), // Emit error state
    );
  }

  /// Returns a debouncing transformer for search events to prevent rapid successive calls.
  EventTransformer<Search> _debounceTransformer() {
    return (Stream<Search> events, EventMapper<Search> mapper) =>
        events.debounceTime(const Duration(milliseconds: 400)).switchMap(mapper);
  }

  /// Cancels the previous request if it's still ongoing.
  void _cancelPreviousRequest() {
    if (_cancelToken != null && !_cancelToken!.isCancelled) {
      _cancelToken?.cancel("Cancelled previous search request");
    }
    _cancelToken = null; // Reset the cancel token
  }
}