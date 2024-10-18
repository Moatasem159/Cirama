import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
abstract class AuthRepository {
  Future<ApiResult<Token>> getRequestToken();
  Future<ApiResult<Token>> getSessionId({required String requestToken});
  Future<ApiResult<Token>> getSavedSessionId();
  Future<ApiResult<MessageModel>> logOut();
}