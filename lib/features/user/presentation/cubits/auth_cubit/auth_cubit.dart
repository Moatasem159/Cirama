import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/api/message_model.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
import 'package:movies_app/features/user/domain/repositories/auth_repository.dart';

part 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthInitial());
  Future<void> requestToken() async {
    emit(const RequestTokenLoading());
    final ApiResult<Token> result = await _authRepository.getRequestToken();
    result.when(
      success: (Token data) => emit(RequestTokenSuccess(token: data)),
      failure: (ErrorHandler handler) => emit(RequestTokenError(message: handler.message.message)),
    );
  }
  Future<void> getSessionId({required String requestToken}) async {
    emit(const GetSessionIdLoading());
    final ApiResult<Token> result = await _authRepository.getSessionId(requestToken: requestToken);
    result.when(
      success: (Token data) => emit(GetSessionIdSuccess(token: data)),
      failure: (ErrorHandler handler) => emit(GetSessionIdError(message: handler.message.message)),
    );
  }
  Future<void> logOut() async {
    emit(const LogOutLoading());
    final ApiResult<MessageModel> result = await _authRepository.logOut();
    result.when(
      success: (MessageModel data) => emit(const LogOutSuccess()),
      failure: (ErrorHandler handler) => emit(LogOutError(message: handler.message.message)),
    );
  }
}