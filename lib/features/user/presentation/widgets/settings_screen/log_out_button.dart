import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/custom_dialog.dart';
import 'package:movies_app/core/widgets/custom_loading.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(GetIt.I.get()),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is LogOutSuccess) {
              Hive.box<SearchModel>("searchBox").clear();
              HydratedBloc.storage.clear();
              InitialRoute().go(context);
            }
            if (state is LogOutError) {
              context.showSnackBar(snackBar(context.locale.errorMessages(state.message)));
            }
          },
          builder: (BuildContext context, AuthState state) {
            if (state is LogOutLoading) {
              return CustomLoading();
            }
            return MainButton(
              title: context.locale.logout,
              border: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              size: Size(double.maxFinite, 40),
              onTap: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) =>
                      BlocProvider<AuthCubit>.value(
                       value:context.read<AuthCubit>() ,
                        child: CustomDialog(
                          title: context.locale.logout,
                          content: context.locale.logoutDialog,
                          onTap: () {
                            context.pop();
                            context.read<AuthCubit>().logOut();
                          },
                          okText: context.locale.yes,
                          cancelText: context.locale.no,
                        ),
                      ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}