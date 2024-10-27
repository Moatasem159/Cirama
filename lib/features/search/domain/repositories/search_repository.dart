import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:movies_app/features/search/data/sources/search_local_data_source.dart';
import 'package:movies_app/features/search/data/sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';

/// Abstract class representing the search repository.
/// This repository defines the methods required for search-related operations,
/// including fetching search results, managing local search data, and saving
/// or deleting searches.
@lazySingleton
abstract class SearchRepository {
  @factoryMethod
  const factory SearchRepository(
    NetworkInfo networkInfo,
    SearchRemoteDataSource searchRemoteDataSource,
    SearchLocalDataSource searchLocalDataSource,
  ) = SearchRepositoryImpl;

  /// Searches for a specific query and returns a [SearchResponse].
  ///
  /// Takes in a [query] string that represents the search term and a
  /// [cancelToken] to manage cancellation of the request if needed.
  ///
  /// Returns an [ApiResult] containing either a [SearchResponse] on success
  /// or an error on failure.
  Future<ApiResult<SearchResponse>> search(String query, CancelToken cancelToken);

  /// Retrieves a list of local search entities.
  ///
  /// This method returns an [ApiResult] containing either a list of
  /// [SearchEntity] objects on success or an error on failure.
  ApiResult<List<SearchEntity>> getLocalSearch();

  /// Saves a given search entity.
  ///
  /// Takes in a [searchEntity] that needs to be saved.
  ///
  /// Returns an [ApiResult] indicating success or failure of the save operation.
  Future<ApiResult<void>> saveSearch(SearchEntity searchEntity);

  /// Deletes a specific search entity.
  ///
  /// Takes in a [searchEntity] that needs to be deleted.
  ///
  /// Returns an [ApiResult] indicating success or failure of the delete operation.
  Future<ApiResult<void>> deleteSearch(SearchEntity searchEntity);

  /// Clears all saved search entities.
  ///
  /// Returns an [ApiResult] indicating success or failure of the operation.
  Future<ApiResult<void>> clearAllSearch();
}