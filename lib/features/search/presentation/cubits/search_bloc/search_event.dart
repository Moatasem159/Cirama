part of 'search_bloc.dart';
sealed class SearchEvent {
  const SearchEvent();
}
final class Search extends SearchEvent {
  final String query;

  const Search({required this.query});
}
final class LocalSearch extends SearchEvent {
  const LocalSearch();
}
final class SaveSearch extends SearchEvent {
  final SearchEntity search;

  const SaveSearch(this.search);
}
final class ClearSearch extends SearchEvent {
  final SearchEntity search;
  const ClearSearch(this.search);
}
final class ClearAllSearch extends SearchEvent {
  const ClearAllSearch();
}