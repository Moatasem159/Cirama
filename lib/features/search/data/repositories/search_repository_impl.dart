import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/features/search/data/mappers/search_mappers.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/search/data/models/search_response_model.dart';
import 'package:movies_app/features/search/data/sources/search_local_data_source.dart';
import 'package:movies_app/features/search/data/sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/domain/entities/search_response.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final NetworkInfo _networkInfo;
  final SearchRemoteDataSource _searchRemoteDataSource;
  final SearchLocalDataSource _searchLocalDataSource;
  const SearchRepositoryImpl(
    this._networkInfo,
    this._searchRemoteDataSource,
    this._searchLocalDataSource,
  );
  @override
  Future<ApiResult<SearchResponse>> search(String  query) async {
    if (!(await _networkInfo.isConnected)) {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
    try {
      final SearchResponseModel response =
          await _searchRemoteDataSource.search(query);
      final SearchResponse result = SearchMapper.toSearchResponse(response);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  ApiResult<List<SearchEntity>> getLocalSearch(){
    try {
      final List<SearchModel> response =  _searchLocalDataSource.getAllSearch();
      final List<SearchEntity> result = response.map((SearchModel e) => SearchMapper.toEntity(e)).toList();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  Future<ApiResult<void>> saveSearch(SearchEntity searchEntity) async{
    try {
      SearchModel searchModel = SearchMapper.fromEntity(searchEntity);
      final void response= await _searchLocalDataSource.saveSearch(searchModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  Future<ApiResult<void>> deleteSearch(SearchEntity searchEntity)async {
    try {
      SearchModel searchModel = SearchMapper.fromEntity(searchEntity);
      final void response= await _searchLocalDataSource.deleteSearch(searchModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  @override
  Future<ApiResult<void>> clearAllSearch()async {
    try {
      final void response= await _searchLocalDataSource.clearAllSearch();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}