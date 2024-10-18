import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
abstract class AccountRepository {
  Future<ApiResult<AccountData>> getAccount();
}