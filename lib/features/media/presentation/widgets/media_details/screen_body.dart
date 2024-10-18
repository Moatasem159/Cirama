import 'package:flutter/material.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_app_bar/details_app_bar.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/details_body.dart';

class MediaDetailsScreenBody extends StatefulWidget {
  final String posterPath;

  const MediaDetailsScreenBody({super.key, required this.posterPath});

  @override
  State<MediaDetailsScreenBody> createState() => _MediaDetailsScreenBodyState();
}

class _MediaDetailsScreenBodyState extends State<MediaDetailsScreenBody> {
  late ScrollController _scrollController;
  bool canPop = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.hasClients) {
      setState(() {
        canPop = _scrollController.position.pixels == _scrollController.position.minScrollExtent;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          DetailsAppBar(posterPath: widget.posterPath, controller: _scrollController),
        ];
      },
      body: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        child: const DetailsBody(),
      ),
    );
  }
}