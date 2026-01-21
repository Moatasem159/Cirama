import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';

class ImageFullscreen extends StatelessWidget {
  final String ?image;

  const ImageFullscreen({super.key, required this.image});

  Future<void> save(BuildContext context) async {
    final imagePath = '${Directory.systemTemp.path}/image.jpg';
    await Dio().download(ImageUrl.hdUrl(image!), imagePath);
    await Gal.putImage(imagePath, album: "Cirama").then(
      (_) {
        if (context.mounted) {
          context.showSnackBar(snackBar(context.locale.imageDownloaded));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => save(context),
          ),
        ),
        body: Hero(
          tag: image!,
          child: InteractiveViewer(
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: ImageUrl.hdUrl(image!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}