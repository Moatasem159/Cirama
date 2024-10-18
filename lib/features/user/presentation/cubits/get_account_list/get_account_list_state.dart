part of 'get_account_list_cubit.dart';

sealed class GetAccountListState {
  const GetAccountListState();
}

final class GetAccountListInitial extends GetAccountListState {
  const GetAccountListInitial();
}

final class GetAccountListLoading extends GetAccountListState {
  final bool firstPage;

  const GetAccountListLoading(this.firstPage);
}

final class LastPage extends GetAccountListState {
  const LastPage();
}
final class GetAccountListSuccess extends GetAccountListState {
  const GetAccountListSuccess();
}

final class GetAccountListError extends GetAccountListState {
  final String message;

  const GetAccountListError({required this.message});
}