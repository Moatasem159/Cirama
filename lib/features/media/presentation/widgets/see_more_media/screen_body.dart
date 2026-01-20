import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/empty_items.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/features/media/presentation/cubits/see_more_media/see_more_media_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/media_vertical_list/media_vertical_list.dart';
import 'package:movies_app/features/media/presentation/widgets/media_vertical_list/sliver_loading_indicator.dart';

class SeeMoreMediaScreenBody extends StatefulWidget {
  const SeeMoreMediaScreenBody({super.key});

  @override
  State<SeeMoreMediaScreenBody> createState() => _SeeMoreMediaScreenBodyState();
}

class _SeeMoreMediaScreenBodyState extends State<SeeMoreMediaScreenBody> {
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
      context.read<SeeMoreMediaCubit>().getMediaList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeeMoreMediaCubit, SeeMoreMediaState>(
      buildWhen: (SeeMoreMediaState previous, SeeMoreMediaState current) =>
          current is SeeMoreMediaLoading || current is SeeMoreMediaSuccess || current is LastPage,
      listenWhen: (SeeMoreMediaState previous, SeeMoreMediaState current) =>
          current is SeeMoreMediaError,
      listener: (BuildContext context, SeeMoreMediaState state) {
        if (state is SeeMoreMediaError) {
          context.showSnackBar(
            snackBar(
              context.locale.errorMessages(state.message),
            ),
          );
        }
      },
      builder: (BuildContext context, SeeMoreMediaState state) => CustomScrollView(
        controller: _scrollController,
        slivers: [
          MediaVerticalList(
            mediaList: context.read<SeeMoreMediaCubit>().mediaListResponse.mediaList,
            listType: context.read<SeeMoreMediaCubit>().params.listType,
          ),
          if (state is SeeMoreMediaLoading) const SliverLoadingIndicator(),
          if (state is LastPage) const EmptyItems(),
        ],
      ),
    );
  }
}