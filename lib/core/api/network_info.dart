import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
@lazySingleton
class NetworkInfo {
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}