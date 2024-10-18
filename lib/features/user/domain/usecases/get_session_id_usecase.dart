import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
import 'package:movies_app/features/user/domain/repositories/auth_repository.dart';

class GetSessionIdUsecase {
  final AuthRepository _authRepository;

  const GetSessionIdUsecase(this._authRepository);

  Future<String> call() async {
    final ApiResult<Token> sessionId =
        await _authRepository.getSavedSessionId();
    switch (sessionId) {
      case ApiSuccess<Token>():
        if (sessionId.data.token.isNotEmpty) {
          return sessionId.data.token;
        } else {
          return '';
        }
      case ApiFailure<Token>():
        return '';
      default:
        return '';
    }
  }
}