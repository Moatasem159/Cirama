part of 'search_bloc.dart';

/// Base class for all search events in the application.
sealed class SearchEvent {
  const SearchEvent();
}

/// Event triggered to perform a search operation.
/// Contains the search [query] that will be used to fetch results.
final class Search extends SearchEvent {
  final String query; // The search query input by the user

  const Search({required this.query});
}

/// Event triggered to fetch local search results from storage.
final class LocalSearch extends SearchEvent {
  const LocalSearch();
}

/// Event triggered to save a search entity.
/// Contains the [search] entity that needs to be saved.
final class SaveSearch extends SearchEvent {
  final SearchEntity search; // The search entity to be saved

  const SaveSearch(this.search);
}

/// Event triggered to clear a specific search entity.
/// Contains the [search] entity that needs to be deleted.
final class ClearSearch extends SearchEvent {
  final SearchEntity search; // The search entity to be cleared

  const ClearSearch(this.search);
}

/// Event triggered to clear all saved searches from storage.
final class ClearAllSearch extends SearchEvent {
  const ClearAllSearch();
}