import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/search/data/mappers/search_mappers.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/search/data/models/search_response_model.dart';
import 'package:movies_app/features/search/data/sources/search_local_data_source.dart';
import 'package:movies_app/features/search/data/sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';

/// Implementation of the [SearchRepository] interface.
/// This class handles search operations by communicating with
/// local and remote data sources, managing search data,
/// and providing error handling.
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource
  _searchRemoteDataSource; // Remote data source for searching
  final SearchLocalDataSource
  _searchLocalDataSource; // Local data source for managing saved searches

  const SearchRepositoryImpl(
    this._searchRemoteDataSource,
    this._searchLocalDataSource,
  );

  @override
  Future<ApiResult<SearchResponse>> search(
    String query,
    CancelToken cancelToken,
  ) async {
    try {
      final SearchResponseModel response = await _searchRemoteDataSource.search(
        cancelToken,
        query,
      );
      final SearchResponse result = SearchMapper.toSearchResponse(
        response,
      ); // Map response to domain model
      return ApiResult.success(result); // Return success result
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      ); // Handle any errors that occur
    }
  }

  @override
  ApiResult<List<SearchEntity>> getLocalSearch() {
    try {
      // Retrieve all saved searches from the local data source
      final List<SearchModel> response = _searchLocalDataSource.getAllSearch;
      final List<SearchEntity> result = response
          .map((SearchModel e) => SearchMapper.toEntity(e))
          .toList(); // Map to domain entities
      return ApiResult.success(result); // Return success result
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      ); // Handle any errors that occur
    }
  }

  @override
  Future<ApiResult<void>> saveSearch(SearchEntity searchEntity) async {
    try {
      // Convert the domain entity to a model and save it locally
      SearchModel searchModel = SearchMapper.fromEntity(searchEntity);
      final void response = await _searchLocalDataSource.saveSearch(
        searchModel,
      );
      return ApiResult.success(response); // Return success result
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      ); // Handle any errors that occur
    }
  }

  @override
  Future<ApiResult<void>> deleteSearch(SearchEntity searchEntity) async {
    try {
      // Convert the domain entity to a model and delete it from local storage
      SearchModel searchModel = SearchMapper.fromEntity(searchEntity);
      final void response = await _searchLocalDataSource.deleteSearch(
        searchModel,
      );
      return ApiResult.success(response); // Return success result
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      ); // Handle any errors that occur
    }
  }

  @override
  Future<ApiResult<void>> clearAllSearch() async {
    try {
      // Clear all saved searches from local storage
      final void response = await _searchLocalDataSource.clearAllSearch();
      return ApiResult.success(response); // Return success result
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      ); // Handle any errors that occur
    }
  }
}