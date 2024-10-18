part of 'search_bloc.dart';
sealed class SearchState {
  const SearchState();
}
final class SearchInitial extends SearchState {
  const SearchInitial();
}
final class SearchLoading extends SearchState {
  const SearchLoading();
}
final class SearchSuccess extends SearchState {
  final SearchResponse data;

  const SearchSuccess({required this.data});
}
final class SearchEmpty extends SearchState {
  const SearchEmpty();
}
final class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});
}
final class LocalSearchSuccess extends SearchState {
  final List<SearchEntity> data;

  const LocalSearchSuccess({required this.data});
}
final class LocalSearchError extends SearchState {
  const LocalSearchError();
}
class SaveSearchSuccess extends SearchState {
  const SaveSearchSuccess();
}
class SaveSearchError extends SearchState {
  const SaveSearchError();
}
class ClearSearchError extends SearchState {
  const ClearSearchError();
}
class ClearAllSearchError extends SearchState {
  const ClearAllSearchError();
}