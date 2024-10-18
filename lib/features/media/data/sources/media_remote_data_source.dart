import 'package:dio/dio.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/media/data/model/media_details_model.dart';
import 'package:movies_app/features/media/data/model/media_list_response_model.dart';
import 'package:movies_app/features/media/data/model/tv_show_model.dart';
import 'package:retrofit/retrofit.dart';

part 'media_remote_data_source.g.dart';

@RestApi()
abstract class MediaRemoteDataSource {
  factory MediaRemoteDataSource(Dio dio) = _MediaRemoteDataSource;
  @GET("getMediaList?mediaType={mediaType}&listType={listType}&page={page}")
  Future<MediaListResponseModel> getMediaList(
    @Path("page") int page,
    @Path("listType") String listType,
    @Path("mediaType") String mediaType,
  );
  @GET("getMediaDetails?mediaType={mediaType}&mediaId={mediaId}")
  Future<MediaDetailsResponseModel> getMediaDetails(
    @Path("mediaType") String mediaType,
    @Path("mediaId") String mediaId,
  );
  @GET("getSeasonDetails?seasonNumber={seasonNumber}&mediaId={mediaId}")
  Future<TvShowSeasonModel> getSeasonDetails(
      @Path("seasonNumber") int seasonNumber,
      @Path("mediaId") String mediaId,
      );
  @GET("getSimilarMedia?mediaType={mediaType}&mediaId={mediaId}&page={page}")
  Future<MediaListResponseModel> getSimilarMedia(
    @Path("page") int page,
    @Path("mediaType") String mediaType,
    @Path("mediaId") String mediaId,
  );
  @POST("mediaAction?mediaType={mediaType}&mediaId={mediaId}&mediaAction={mediaAction}")
  Future<MessageModel> mediaAction(
    @Path("mediaType") String mediaType,
    @Path("mediaId") String mediaId,
    @Path("mediaAction") String mediaAction,
    @Body() Map<String, dynamic> body,
  );
  @DELETE("mediaAction?mediaType={mediaType}&mediaId={mediaId}&mediaAction={mediaAction}")
  Future<MessageModel> deleteRate(
      @Path("mediaType") String mediaType,
      @Path("mediaId") String mediaId,
      @Path("mediaAction") String mediaAction,
      );
}