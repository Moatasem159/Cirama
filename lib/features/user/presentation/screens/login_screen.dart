import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatefulWidget {
  final String requestToken;

  const LoginScreen({super.key, required this.requestToken});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final WebViewController controller;
  bool isReady = false;
  double progress = 0;

  void clearWebViewData() {
    controller..clearCache()..clearLocalStorage();
    WebViewCookieManager().clearCookies();
  }
  @override
  void dispose() {
    controller.setNavigationDelegate(NavigationDelegate());
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse(
          'https://www.themoviedb.org/authenticate/${widget.requestToken}'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (UrlChange change) {
            if (change.url ==
                "https://www.themoviedb.org/authenticate/${widget.requestToken}/allow") {
              context.pop();
              clearWebViewData();
              context
                  .read<AuthCubit>()
                  .getSessionId(requestToken: widget.requestToken);
            }
          },
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Cirama"),
            centerTitle: true,
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            child: isReady
                ? WebViewWidget(controller: controller)
                : loadingBody(progress),
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