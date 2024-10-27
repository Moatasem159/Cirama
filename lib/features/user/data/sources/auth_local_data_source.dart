import 'package:movies_app/core/storage/shared_preferences_factory.dart';
import 'package:movies_app/features/user/data/models/session_model.dart';
import 'package:movies_app/features/user/domain/entities/token.dart';
abstract class AuthLocalDataSource {
  const factory AuthLocalDataSource(SharedPreferencesFactory sharedPreferencesFactory) = _AuthLocalDataSourceImpl;
  Future<void> saveSessionId(Token token);
  Future<SessionModel> getSessionId();
  Future<void> deleteSessionId();
}
class _AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferencesFactory _sharedPreferencesFactory;
  const _AuthLocalDataSourceImpl(this._sharedPreferencesFactory);
  @override
  Future<SessionModel> getSessionId() async {
    final String sessionId = await _sharedPreferencesFactory.getSecuredString("sessionId");
    final SessionModel model = SessionModel(sessionId: sessionId);
    return model;
  }
  @override
  Future<void> saveSessionId(Token token) async {
    await _sharedPreferencesFactory.setSecuredString("sessionId", token.token);
  }
  @override
  Future<void> deleteSessionId() async {
    _sharedPreferencesFactory.deleteSecuredString("sessionId");
  }
}