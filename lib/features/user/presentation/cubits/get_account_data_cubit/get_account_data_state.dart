part of 'get_account_data_cubit.dart';

sealed class GetAccountDataState {
  const GetAccountDataState();
}

final class GetAccountDataInitial extends GetAccountDataState {
  const GetAccountDataInitial();
}

final class GetAccountDataLoading extends GetAccountDataState {
  const GetAccountDataLoading();
}

final class GetAccountDataSuccess extends GetAccountDataState {
  final AccountData accountData;
  final String sessionId;

  const GetAccountDataSuccess({required this.accountData, required this.sessionId});

  factory GetAccountDataSuccess.fromJson(Map<String, dynamic> json) {
    final AccountDataModel model = AccountDataModel.fromJson(json['accountData']);
    final AccountData accountData = AccountMapper.fromModel(model);
    return GetAccountDataSuccess(accountData: accountData, sessionId: json['sessionId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'accountData': AccountMapper.toModel(accountData).toJson(),
      'sessionId': AppConstants.sessionId,
    };
  }
}

final class GetAccountDataError extends GetAccountDataState {
  final String message;

  const GetAccountDataError({required this.message});
}