import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaWebScreen extends StatefulWidget {
  final String? url;

  const MediaWebScreen({super.key, required this.url});

  @override
  State<MediaWebScreen> createState() => _MediaWebScreenState();
}

class _MediaWebScreenState extends State<MediaWebScreen> {
  late final WebViewController controller;
  bool isReady = false;
  double progress = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url!))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onProgress: (int progress) {
            setState(() {
              this.progress = progress.toDouble() / 100;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isReady = true;
            });
          },
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Cirama"),
            centerTitle: true,
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            child: isReady ? WebViewWidget(controller: controller) : loadingBody(progress),
          ),
        ),
      ),
    );
  }

  Widget loadingBody(double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(8),
        backgroundColor: Colors.grey,
        minHeight: 5,
        value: progress,
        valueColor: AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
      ),
    );
  }
}