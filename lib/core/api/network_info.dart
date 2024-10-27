import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetworkInfo {
  const factory NetworkInfo(InternetConnectionChecker connectionChecker) = _NetworkInfoImpl;
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> checkConnection();
}
class _NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker _connectionChecker;
  const _NetworkInfoImpl(this._connectionChecker);
  @override
  Future<bool> get isConnected async => await _connectionChecker.hasConnection;
  @override
  Stream<InternetConnectionStatus> checkConnection() {
    return _connectionChecker.onStatusChange;
  }
}