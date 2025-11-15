import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'index.dart';

abstract class BaseErrorHandler {
  String handleError(dynamic error, [StackTrace? stackTrace]);
}

class _ErrorFactory {
  static BaseErrorHandler getErrorHandler(dynamic error) {
    return switch (error) {
      // 1. Connectivity and Low-Level Network Errors
      SocketException() ||
      TimeoutException() ||
      HandshakeException() ||
      TlsException() ||
      HttpException() => NetworkIssueHandler(),

      // 2. Dio Expection Handler
      DioException() => DioErrorHandler(),

      // 3. Data Parsing and Format Errors
      FormatException() || TypeError() => ParserErrorHandler(),

      // 4. Isar Errors
      IsarError() => IsarErrorHandler(),

      // 5. Supabase Errors
      AuthException() || PostgrestException() => SupabaseErrorHandler(),

      // 5. Google Sign In Errors
      GoogleSignInException() => GoogleErrorHandler(),

      // adding another error handlers here like Supabase, Firebase, GraphQL, etc.

      // 6. Catch-all for unexpected issues
      _ => GenericErrorHandler(),
    };
  }
}

String handleError(dynamic error, [StackTrace? stackTrace]) {
  final errorHandler = _ErrorFactory.getErrorHandler(error);
  final errorString = errorHandler.handleError(error, stackTrace);
  LogHelper.error(errorString, error: error, stackTrace: stackTrace);
  return errorString;
}
