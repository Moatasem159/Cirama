import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_params.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_list/get_account_list_cubit.dart';
import 'package:movies_app/features/user/presentation/widgets/account_list_screen/screen_body.dart';

class AccountListScreen extends StatelessWidget {
  final ListType listType;

  const AccountListScreen({super.key, required this.listType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAccountListCubit>(
      create: (context) => GetAccountListCubit(
        GetIt.I.get(),
        MediaListParams(
          listType: listType,
          mediaType: listType.mediaType,
        ),
      )..getMediaList(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(context),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 40,
              leading: IconButton(
                onPressed: context.pop,
                splashRadius: 20,
                iconSize: context.screenWidth / 18,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back,
                  size: context.screenWidth / 18,
                ),
              ),
              title: Text(
                context.locale.userLists(listType.name),
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textScaler: TextScaler.linear(context.screenWidth / 350),
              ),
            ),
            body: const AccountListScreenBody(),
          ),
        ),
      ),
    );
  }
}