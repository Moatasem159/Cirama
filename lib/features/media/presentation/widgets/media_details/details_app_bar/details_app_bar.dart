import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/functions/calculate_icon_position.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';

part 'delegate_buttons.dart';
part 'link_button.dart';
part 'logo_widget.dart';
part 'poster_delegate.dart';
part 'poster_widget.dart';
class DetailsAppBar extends StatelessWidget {
  final ScrollController controller;
  final String posterPath;
  const DetailsAppBar({super.key,required this.posterPath, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: PosterDelegate(posterPath: posterPath,controller: controller),
      ),
    );
  }
}