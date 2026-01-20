import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/features/user/data/mapper/account_mapper.dart';
import 'package:movies_app/features/user/data/models/account_data_model.dart';
import 'package:movies_app/features/user/data/sources/account_data_source.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
import 'package:movies_app/features/user/domain/repositories/account_repository.dart';
class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource _accountDataSource;

 const AccountRepositoryImpl(this._accountDataSource);

  @override
  Future<ApiResult<AccountData>> getAccount() async {
    try {
      final AccountDataModel response = await _accountDataSource.getAccount();
      final AccountData result = AccountMapper.fromModel(response);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}