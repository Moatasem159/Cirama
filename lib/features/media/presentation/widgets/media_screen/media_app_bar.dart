import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';

part 'media_title.dart';
class MediaAppBar extends StatefulWidget {
  final MediaType mediaType;
  const MediaAppBar({super.key, required this.mediaType});
  @override
  State<MediaAppBar> createState() => _MediaAppBarState();
}
class _MediaAppBarState extends State<MediaAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _sliderController;
  late final Animation<Offset> _nameSlideTransition;
  late final CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _sliderController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _curveAnimations = CurvedAnimation(
        parent: _sliderController, curve: Curves.fastLinearToSlowEaseIn);
    _nameSlideTransition =
        Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
            .animate(_curveAnimations);
    _sliderController.forward();
  }
  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SlideTransition(
        position: _nameSlideTransition,
        child: _MediaTitle(widget.mediaType),
      ),
    );
  }
}