import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/user/data/models/request_token_model.dart';
import 'package:movies_app/features/user/data/models/session_model.dart';
import 'package:movies_app/features/user/data/sources/auth_data_source.dart';
import 'package:movies_app/features/user/data/sources/auth_local_data_source.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
import 'package:movies_app/features/user/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  const AuthRepositoryImpl(
      this._networkInfo, this._authDataSource, this._authLocalDataSource);

  @override
  Future<ApiResult<Token>> getRequestToken() async {
    if (await _networkInfo.isConnected) {
      try {
        final RequestTokenModel result =
            await _authDataSource.getRequestToken();
        final Token token = Token(token: result.requestToken);
        return ApiResult.success(token);
      } catch (e) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    } else {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
  }

  @override
  Future<ApiResult<Token>> getSessionId({required String requestToken}) async {
    if (await _networkInfo.isConnected) {
      try {
        final SessionModel result =
            await _authDataSource.getSessionId(requestToken);
        final Token token = Token(token: result.sessionId);
        AppConstants.sessionId = token.token;
        await _authLocalDataSource.saveSessionId(token);
        return ApiResult.success(token);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
  }
  @override
  Future<ApiResult<Token>> getSavedSessionId() async {
    try {
      final SessionModel result = await _authLocalDataSource.getSessionId();
      final Token token = Token(token: result.sessionId);
      AppConstants.sessionId = token.token;
      return ApiResult.success(token);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MessageModel>> logOut()async {
    if (await _networkInfo.isConnected) {
      try {
        final MessageModel result = await _authDataSource.logout(SessionModel(sessionId: AppConstants.sessionId));
        await _authLocalDataSource.deleteSessionId();
        AppConstants.sessionId = '';
        return ApiResult.success(result);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(ErrorHandler.handle(const NetworkException()));
    }
  }
}