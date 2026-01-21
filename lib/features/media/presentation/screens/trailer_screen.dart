import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/core/widgets/youtube_video_player.dart';

class TrailerScreen extends StatelessWidget {
  final String? name;
  final String? videoKey;
  final String? site;
  final String? type;
  final bool? official;

  const TrailerScreen({
    super.key,
    required this.name,
    required this.videoKey,
    required this.site,
    required this.type,
    required this.official,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(name!, style: context.titleMedium),
        ),
        body: YoutubePlayerVideo(url: videoKey!, title: name!),
      ),
    );
  }
}