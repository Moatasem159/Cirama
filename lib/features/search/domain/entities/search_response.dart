import 'package:movies_app/features/search/domain/entities/search_entity.dart';

class SearchResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<SearchEntity> results;

  const SearchResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });
}