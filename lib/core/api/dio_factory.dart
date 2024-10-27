import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/env.dart';
import 'package:movies_app/core/utils/app_constant.dart';

@module
abstract class DioFactory {
  @factoryMethod
  Dio get createInstance{
    Duration timeOut = const Duration(seconds: 20);
    final Dio dio = Dio();
    dio
      ..options.baseUrl = "https://api.themoviedb.org/3/"
      ..options.headers = {"Content-Type": "application/json"}
      ..options.sendTimeout = timeOut
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.responseType = ResponseType.plain
      ..options.receiveDataWhenStatusError = true
      ..options.followRedirects = false
      ..interceptors.add(CustomInterceptor());
    return dio;
  }
}

class CustomInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["api_key"] = Env.apiKey;
    _checkListType(options);
    _getMediaDetails(options);
    _mediaAction(options);
    _getSimilarMedia(options);
    _getSeasonDetails(options);
    _search(options);
    _getAccountData(options);
    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  void _checkListType(RequestOptions options) {
    if (options.uri.pathSegments.contains("getMediaList")) {
      final String mediaType = options.uri.queryParameters["mediaType"]!;
      final String listType = options.uri.queryParameters["listType"]!;
      final String page = options.uri.queryParameters["page"]!;
      if (listType == "trending") {
        options.path = "trending/$mediaType/day";
      } else if (listType == "rated" || listType == "favorite" || listType == "watchlist") {
        if (mediaType == "movie") {
          options.path = "account/{account_id}/$listType/movies";
        } else {
          options.path = "account/{account_id}/$listType/$mediaType";
        }
        options.queryParameters["session_id"] = AppConstants.sessionId;
      } else {
        options.path = "$mediaType/$listType";
      }
      options.queryParameters["page"] = page;
      options.queryParameters["language"] = AppConstants.appLanguage;
    }
  }

  void _getMediaDetails(RequestOptions options) {
    if (options.uri.pathSegments.contains("getMediaDetails")) {
      final String mediaType = options.uri.queryParameters["mediaType"]!;
      final String mediaId = options.uri.queryParameters["mediaId"]!;
      options.path =
          "$mediaType/$mediaId?append_to_response=keywords,recommendations,credits,images,account_states,videos&include_image_language=en,ar,it,fr,es,null";
      options.queryParameters["language"] = AppConstants.appLanguage;
      options.queryParameters["session_id"] = AppConstants.sessionId;
    }
  }

  void _mediaAction(RequestOptions options) {
    if (options.uri.pathSegments.contains("mediaAction")) {
      final String mediaType = options.uri.queryParameters["mediaType"]!;
      final String mediaId = options.uri.queryParameters["mediaId"]!;
      final String mediaAction = options.uri.queryParameters["mediaAction"]!;
      if (mediaAction == "rating" || mediaAction == "deleteRating") {
        options.path = "$mediaType/$mediaId/rating";
      } else {
        options.path = "account/{account_id}/$mediaAction";
      }
      options.queryParameters['session_id'] = AppConstants.sessionId;
    }
  }

  void _getSimilarMedia(RequestOptions options) {
    if (options.uri.pathSegments.contains("getSimilarMedia")) {
      final String mediaType = options.uri.queryParameters["mediaType"]!;
      final String mediaId = options.uri.queryParameters["mediaId"]!;
      final String page = options.uri.queryParameters["page"]!;
      options.path = "$mediaType/$mediaId/similar";
      options.queryParameters["language"] = AppConstants.appLanguage;
      options.queryParameters["page"] = page;
    }
  }

  void _getSeasonDetails(RequestOptions options) {
    if (options.uri.pathSegments.contains("getSeasonDetails")) {
      final String mediaId = options.uri.queryParameters["mediaId"]!;
      final String seasonNumber = options.uri.queryParameters["seasonNumber"]!;
      options.path = "tv/$mediaId/season/$seasonNumber";
      options.queryParameters["language"] = AppConstants.appLanguage;
    }
  }

  void _search(RequestOptions options) {
    if (options.uri.pathSegments.contains("search")) {
      final String query = options.uri.queryParameters["query"]!;
      options.path = "search/multi";
      options.queryParameters["language"] = AppConstants.appLanguage;
      options.queryParameters["query"] = query;
      options.queryParameters["page"] = '1';
    }
  }

  void _getAccountData(RequestOptions options) {
    if (options.uri.pathSegments.contains("getAccountData")) {
      options.path = "account";
      options.queryParameters['session_id'] = AppConstants.sessionId;
    }
  }
}