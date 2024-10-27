import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/features/user/data/repositories/account_repository_impl.dart';
import 'package:movies_app/features/user/data/sources/account_data_source.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
@lazySingleton
abstract class AccountRepository {
  @factoryMethod
  const factory AccountRepository(NetworkInfo networkInfo, AccountDataSource accountDataSource) = AccountRepositoryImpl;
  Future<ApiResult<AccountData>> getAccount();
}