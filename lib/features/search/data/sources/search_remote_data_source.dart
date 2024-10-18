import 'package:dio/dio.dart';
import 'package:movies_app/features/search/data/models/search_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_remote_data_source.g.dart';
@RestApi()
abstract class SearchRemoteDataSource {
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;
  @GET("search?query={query}")
  Future<SearchResponseModel> search(
    @Path("query") String query,
  );
}