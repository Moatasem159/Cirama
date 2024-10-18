import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/custom_loading.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is GetSessionIdSuccess) {
          context.goNamed("movie");
        }
        if (state is RequestTokenSuccess) {
          LoginRoute(requestToken: state.token.token,$extra: context.read<AuthCubit>()).push(context);
        }
        if (state is GetSessionIdError) {
          context.showSnackBar(snackBar(context.locale.errorMessages(state.message)));
        }
        if (state is RequestTokenError) {
          context.showSnackBar(snackBar(context.locale.errorMessages(state.message)));
        }
      },
      builder: (BuildContext context, AuthState state) {
        if (state is RequestTokenLoading || state is GetSessionIdLoading) {
          return const CustomLoading();
        }
        return MainButton(
          title: context.locale.letsStart,
          onTap: context.read<AuthCubit>().requestToken,
        );
      },
    );
  }
}