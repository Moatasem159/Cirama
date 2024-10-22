import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/empty_items.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/presentation/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:movies_app/features/media/presentation/widgets/media_vertical_list/sliver_loading_indicator.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_list/get_account_list_cubit.dart';

part 'empty_list_body.dart';
class AccountListScreenBody extends StatefulWidget {
  const AccountListScreenBody({super.key});

  @override
  State<AccountListScreenBody> createState() => _AccountListScreenBodyState();
}

class _AccountListScreenBodyState extends State<AccountListScreenBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      context.read<GetAccountListCubit>().getMediaList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAccountListCubit, GetAccountListState>(
      buildWhen: (GetAccountListState previous, GetAccountListState current) =>
          current is GetAccountListLoading ||
          current is GetAccountListSuccess ||
          current is LastPage,
      listenWhen: (GetAccountListState previous, GetAccountListState current) =>
          current is GetAccountListError,
      listener: (BuildContext context, GetAccountListState state) {
        if (state is GetAccountListError) {
          context.showSnackBar(
            snackBar(
              context.locale.errorMessages(state.message),
            ),
          );
        }
      },
      builder: (BuildContext context, GetAccountListState state) => CustomScrollView(
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        controller: _scrollController,
        slivers: [
          if (state is GetAccountListSuccess && context.read<GetAccountListCubit>().mediaListResponse.mediaList.isEmpty)
            _EmptyList(context.read<GetAccountListCubit>().params.listType),
          MediaVerticalList(
            mediaList: context.read<GetAccountListCubit>().mediaListResponse.mediaList,
            listType: context.read<GetAccountListCubit>().params.listType,
          ),
          if (state is GetAccountListLoading && state.firstPage)
            MediaVerticalList(
              enabled: true,
              mediaList: List.generate(
                12,
                (index) => MediaListItem(),
              ),
              listType: context.read<GetAccountListCubit>().params.listType,
            ),
          if (state is GetAccountListLoading && !state.firstPage) const SliverLoadingIndicator(),
          if (state is LastPage) const EmptyItems(),
        ],
      ),
    );
  }
}