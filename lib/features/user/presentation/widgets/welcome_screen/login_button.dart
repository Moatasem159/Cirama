import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is RequestTokenSuccess ||
          current is GetSessionIdSuccess ||
          current is GetSessionIdError ||
          current is RequestTokenError,
      listener: (BuildContext context, AuthState state) {
        if (state is RequestTokenSuccess) {
          LoginRoute(
            requestToken: state.token.token,
            $extra: context.read<AuthCubit>(),
          ).push(context);
        }
        if (state is GetSessionIdSuccess) {
          context.push("/movie");
        }
        if (state is GetSessionIdError) {
          context.showSnackBar(
            snackBar(context.locale.errorMessages(state.message)),
          );
        }
        if (state is RequestTokenError) {
          context.showSnackBar(
            snackBar(context.locale.errorMessages(state.message)),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is RequestTokenLoading || current is GetSessionIdLoading,
      builder: (BuildContext context, AuthState state) {
        if (state is RequestTokenLoading || state is GetSessionIdLoading) {
          return const CircularProgressIndicator(
            strokeWidth: 1,
            padding: .all(6),
          );
        }
        return MainButton(
          title: context.locale.letsStart,
          onTap: context.read<AuthCubit>().requestToken,
        );
      },
    );
  }
}