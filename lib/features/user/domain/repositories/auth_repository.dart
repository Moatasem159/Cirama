import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/user/data/repositories/auth_repository_impl.dart';
import 'package:movies_app/features/user/data/sources/auth_data_source.dart';
import 'package:movies_app/features/user/data/sources/auth_local_data_source.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
@lazySingleton
abstract class AuthRepository {
  @factoryMethod
  const factory AuthRepository(
    AuthDataSource authDataSource,
    AuthLocalDataSource authLocalDataSource,
  ) = AuthRepositoryImpl;

  Future<ApiResult<Token>> getRequestToken();

  Future<ApiResult<Token>> getSessionId({required String requestToken});

  Future<ApiResult<Token>> getSavedSessionId();

  Future<ApiResult<MessageModel>> logOut();
}