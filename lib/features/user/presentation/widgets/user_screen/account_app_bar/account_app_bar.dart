import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_data_cubit/get_account_data_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'app_bar_widget.dart';
class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAccountDataCubit, GetAccountDataState>(
      builder: (BuildContext context, GetAccountDataState state) {
        switch (state) {
          case GetAccountDataInitial _:
            return const SizedBox.shrink();
          case GetAccountDataLoading _:
            return const _AccountAppBarWidget(AccountData.empty, true);
          case GetAccountDataSuccess _:
            return _AccountAppBarWidget(state.accountData, false);
          case GetAccountDataError _:
            return const _AppBarError();
        }
      },
    );
  }
}