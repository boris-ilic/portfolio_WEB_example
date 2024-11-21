import 'dart:io';

import 'package:dio/dio.dart';

enum NetworkExceptionTypes {
  badResponse,

  noInternet,

  connectionTimeout,

  sendTimeout,

  receiveTimeout,

  badCertificate,

  cancel,

  connectionError,

  unknown,
}

class NetworkException implements Exception {
  final int? statusCode;
  final String message;
  final NetworkExceptionTypes reason;

  NetworkException({
    this.statusCode,
    required this.message,
    required this.reason,
  });

  static badResponse(int statusCode, String message) => NetworkException(
        statusCode: statusCode,
        message: message,
        reason: NetworkExceptionTypes.badResponse,
      );

  static get connectionTimeout => NetworkException(
        message: 'connection timeout ',
        reason: NetworkExceptionTypes.connectionTimeout,
      );

  static get sendTimeout => NetworkException(
        message: 'send timeout ',
        reason: NetworkExceptionTypes.sendTimeout,
      );

  static get receiveTimeout => NetworkException(
        message: 'receive Timeout',
        reason: NetworkExceptionTypes.receiveTimeout,
      );

  static get badCertificate => NetworkException(
        message: 'bad certificate ',
        reason: NetworkExceptionTypes.badCertificate,
      );

  static get cancel => NetworkException(
        message: 'request cancelled',
        reason: NetworkExceptionTypes.cancel,
      );

  static get connectionError => NetworkException(
        message: 'connection error',
        reason: NetworkExceptionTypes.connectionError,
      );

  static get unknown => NetworkException(
        message: 'unknown network error ',
        reason: NetworkExceptionTypes.unknown,
      );

  static get noInternet => NetworkException(
        message: 'No Internet Connection',
        reason: NetworkExceptionTypes.noInternet,
      );
}

extension DioExceptionX on DioException {
  NetworkException get toNetworkException {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return NetworkException.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return NetworkException.receiveTimeout;
      case DioExceptionType.badCertificate:
        return NetworkException.badCertificate;
      case DioExceptionType.badResponse:
        return NetworkException.badResponse(
          response!.statusCode!,
          response!.data['message'],
        );
      case DioExceptionType.cancel:
        return NetworkException.cancel;
      case DioExceptionType.connectionError:
        return NetworkException.connectionError;
      case DioExceptionType.unknown:
        if (error is SocketException) {
          return NetworkException.noInternet;
        }
        return NetworkException.unknown;
    }
  }
}
