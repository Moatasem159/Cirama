import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movies_app/core/api/api_result.dart';
import 'package:movies_app/core/api/error_handler.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/user/data/mapper/account_mapper.dart';
import 'package:movies_app/features/user/data/models/account_data_model.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
import 'package:movies_app/features/user/domain/repositories/account_repository.dart';

part 'get_account_data_state.dart';
class GetAccountDataCubit extends HydratedCubit<GetAccountDataState> {
  final AccountRepository _accountRepository;
  GetAccountDataCubit(this._accountRepository) : super(GetAccountDataInitial());
  Future<void> getAccountData() async {
    if (state is! GetAccountDataSuccess) {
      emit(const GetAccountDataLoading());
      final ApiResult<AccountData> result = await _accountRepository.getAccount();
      result.when(
        success: (data) =>
            emit(GetAccountDataSuccess(accountData: data, sessionId: AppConstants.sessionId)),
        failure: (ErrorHandler error) => emit(GetAccountDataError(message: error.message.message)),
      );
    }
  }
  @override
  GetAccountDataState? fromJson(Map<String, dynamic> json) {
    if (json['sessionId'] == AppConstants.sessionId) {
      return GetAccountDataSuccess.fromJson(json);
    } else {
      clear();
      return null;
    }
  }
  @override
  Map<String, dynamic>? toJson(GetAccountDataState state) {
    if (state is GetAccountDataSuccess) {
      return state.toJson();
    } else {
      return null;
    }
  }
}