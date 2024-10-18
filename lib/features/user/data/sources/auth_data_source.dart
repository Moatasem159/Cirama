import 'package:dio/dio.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/user/data/models/request_token_model.dart';
import 'package:movies_app/features/user/data/models/session_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_data_source.g.dart';

@RestApi()
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @GET("authentication/token/new")
  Future<RequestTokenModel> getRequestToken();

  @GET("authentication/session/new?request_token={request_token}")
  Future<SessionModel> getSessionId(@Path("request_token") String requestToken);

  @DELETE("authentication/session")
  Future<MessageModel> logout(@Body() SessionModel body);
}