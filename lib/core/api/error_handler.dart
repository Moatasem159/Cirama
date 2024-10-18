import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/core/api/message_model.dart';

class ErrorHandler {
  late final MessageModel message;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      message = _handleDioError(error);
    } else if (error is NetworkException) {
      message = const MessageModel(ErrorMassages.connectionError);
    } else {
      debugPrint(error.toString());
      message = MessageModel(error.toString());
    }
  }

  MessageModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const MessageModel(ErrorMassages.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return const MessageModel(ErrorMassages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return const MessageModel(ErrorMassages.receiveTimeout);
      case DioExceptionType.badCertificate:
        return const MessageModel(ErrorMassages.badCertificate);
      case DioExceptionType.badResponse:
        return const MessageModel(ErrorMassages.badResponse);
      case DioExceptionType.cancel:
        return const MessageModel(ErrorMassages.cancelRequest);
      case DioExceptionType.connectionError:
        return const MessageModel(ErrorMassages.connectionError);
      case DioExceptionType.unknown:
        return const MessageModel(ErrorMassages.unKnownError);
      default:
        return const MessageModel(ErrorMassages.defaultError);
    }
  }
}

class NetworkException implements Exception {
  const NetworkException();
}

abstract class ErrorMassages {
  static const String connectionTimeout = "connectionTimeout";
  static const String sendTimeout = "sendTimeout";
  static const String receiveTimeout = "receiveTimeout";
  static const String badCertificate = "badCertificate";
  static const String badResponse = "badResponse";
  static const String cancelRequest = "cancelRequest";
  static const String connectionError = "connectionError";
  static const String unKnownError = "unKnownError";
  static const String defaultError = "defaultError";
}