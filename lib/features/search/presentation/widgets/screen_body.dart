import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/core/widgets/custom_loading.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/search/domain/entities/search_entity.dart';
import 'package:movies_app/features/search/presentation/cubits/search_bloc/search_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'empty_body.dart';
part 'loading_body.dart';
part 'local_search_body.dart';
part 'recent_search.dart';
part 'search_bar.dart';
part 'success_body.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (BuildContext context, SearchState state) {
        if (state is SearchError ||
            state is LocalSearchError ||
            state is SaveSearchError ||
            state is ClearSearchError ||
            state is ClearAllSearchError) {
          context.showSnackBar(snackBar(context.locale.errorMessages("defaultError")));
        }
      },
      child: CustomScrollView(
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        physics: const BouncingScrollPhysics(),
        slivers: const [
          _CustomSearchBar(),
          _SearchLoadingBody(),
          _RecentSearch(),
          _SuccessBody(),
          _EmptyBody(),
          _LocalSearchBody(),
        ],
      ),
    );
  }
}