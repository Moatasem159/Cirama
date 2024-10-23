part of 'search_bloc.dart';

/// Base class for all search states in the application.
sealed class SearchState {
  const SearchState();
}

/// Initial state of the search feature, representing the starting point before any search has been made.
final class SearchInitial extends SearchState {
  const SearchInitial();
}

/// State indicating that a search is currently in progress.
final class SearchLoading extends SearchState {
  const SearchLoading();
}

/// State representing a successful search operation.
/// Contains the [SearchResponse] data returned from the search.
final class SearchSuccess extends SearchState {
  final SearchResponse data; // The data retrieved from the search

  const SearchSuccess({required this.data});
}

/// State representing an empty search result, indicating no matches were found.
final class SearchEmpty extends SearchState {
  const SearchEmpty();
}

/// State representing an error that occurred during a search operation.
/// Contains an error message that describes the issue.
final class SearchError extends SearchState {
  final String message; // The error message explaining the search failure

  const SearchError({required this.message});
}

/// State representing a successful local search operation.
/// Contains a list of [SearchEntity] items retrieved from local storage.
final class LocalSearchSuccess extends SearchState {
  final List<SearchEntity> data; // The data retrieved from the local search

  const LocalSearchSuccess({required this.data});
}

/// State representing an error that occurred during a local search operation.
final class LocalSearchError extends SearchState {
  const LocalSearchError();
}

/// State representing a successful save operation for a search item.
class SaveSearchSuccess extends SearchState {
  const SaveSearchSuccess();
}

/// State representing an error that occurred while trying to save a search item.
class SaveSearchError extends SearchState {
  const SaveSearchError();
}

/// State representing an error that occurred during a clear search operation.
class ClearSearchError extends SearchState {
  const ClearSearchError();
}

/// State representing an error that occurred during a clear all search operation.
class ClearAllSearchError extends SearchState {
  const ClearAllSearchError();
}