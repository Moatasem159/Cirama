import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';

abstract class SearchRepository {
  Future<ApiResult<SearchResponse>> search(String  query);

  ApiResult<List<SearchEntity>> getLocalSearch();

  Future<ApiResult<void>> saveSearch(SearchEntity searchEntity);

  Future<ApiResult<void>> deleteSearch(SearchEntity searchEntity);

  Future<ApiResult<void>> clearAllSearch();
}