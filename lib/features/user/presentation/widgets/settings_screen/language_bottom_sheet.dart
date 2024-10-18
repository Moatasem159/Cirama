import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/custom_dialog.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/user/presentation/cubits/settings_cubit/settings_cubit.dart';
class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              context.locale.appLanguage,
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          const VerticalSpace(6),
          Divider(),
          CheckboxListTile.adaptive(
            title: Text(context.locale.english),
            value: context.read<SettingsCubit>().isEnglish(),
            onChanged: (_) {
              if (!context.read<SettingsCubit>().isEnglish()) {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) {
                    return ChangeLanguageDialog(
                      onTap: context.read<SettingsCubit>().toEnglish,
                    );
                  },
                );
              }
            },
          ),
          const VerticalSpace(6),
          CheckboxListTile.adaptive(
            title: Text(context.locale.arabic),
            value: context.read<SettingsCubit>().isArabic(),
            onChanged: (_) {
              if (!context.read<SettingsCubit>().isArabic()) {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) {
                    return ChangeLanguageDialog(
                      onTap: context.read<SettingsCubit>().toArabic,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChangeLanguageDialog extends StatelessWidget {
  final VoidCallback onTap;

  const ChangeLanguageDialog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: context.locale.changeLang,
      content: context.locale.changeLangDialog,
      onTap: onTap,
      okText: context.locale.agree,
      cancelText: context.locale.disagree,
    );
  }
}