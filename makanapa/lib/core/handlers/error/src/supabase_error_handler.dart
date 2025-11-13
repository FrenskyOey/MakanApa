import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';

class SupabaseErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is AuthException) {
      return _handleAuthException(error);
    }
    if (error is PostgrestException) {
      return _handlePostgrestException(error);
    }
    return 'An unexpected Supabase error occurred. Please try again.';
  }

  /// Converts an [AuthException] into a user-friendly error message.
  String _handleAuthException(AuthException error) {
    final message = error.message.toLowerCase();
    if (message.contains('invalid login credentials')) {
      return 'Invalid email or password. Please try again.';
    }
    if (message.contains('user not found')) {
      return 'No user found with that email address.';
    }
    if (message.contains('email not confirmed')) {
      return 'Please confirm your email address before logging in.';
    }
    if (message.contains('email rate limit exceeded')) {
      return 'Too many requests. Please try again later.';
    }
    if (message.contains('user already registered')) {
      return 'An account with this email already exists.';
    }
    if (message.contains('invalid refresh token')) {
      return 'Your session has expired. Please log in again.';
    }
    return 'Authentication failed: ${error.message}';
  }

  /// Converts a [PostgrestException] into a user-friendly error message.
  String _handlePostgrestException(PostgrestException error) {
    // This code indicates that .single() was called but no rows were found.
    if (error.code == 'PGRST116') {
      return 'The requested item could not be found.';
    }
    if (error.message.contains('violates row-level security policy')) {
      return 'You do not have permission to perform this action.';
    }
    if (error.message.contains('Project is temporarily unavailable')) {
      return 'The service is temporarily unavailable. This may be due to project inactivity. Please try again later.';
    }
    // A generic message for other database-related issues.
    return 'A database error occurred. Please try again later.';
  }
}
