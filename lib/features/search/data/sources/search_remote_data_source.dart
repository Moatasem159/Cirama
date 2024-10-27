import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/search/data/models/search_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_remote_data_source.g.dart';

/// An abstract class that defines the remote data source for search operations.
/// This class uses Retrofit to handle API calls related to search functionality.
@lazySingleton
@RestApi()
abstract class SearchRemoteDataSource {
  /// A factory constructor that creates an instance of [SearchRemoteDataSource]
  /// using the provided [Dio] instance for making HTTP requests.
  @factoryMethod
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;

  /// Performs a search query against the remote API.
  ///
  /// This method sends a GET request to the search endpoint with the specified
  /// query parameter.
  ///
  /// Parameters:
  /// - [cancelToken]: A token to cancel the request if needed.
  /// - [query]: The search query string used to find results.
  ///
  /// Returns a [Future<SearchResponseModel>] which resolves to the search response model.
  @GET("search?query={query}")
  Future<SearchResponseModel> search(
      @CancelRequest() CancelToken cancelToken, // Used to cancel the request
      @Path("query") String query, // The search query
      );
}