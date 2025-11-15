import 'package:google_sign_in/google_sign_in.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';

class GoogleErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is GoogleSignInException) {
      return _handleGoogleSignInException(error);
    }
    return 'Terjadi kesalahan tak terduga saat masuk dengan Google. Silakan coba lagi.';
  }

  String _handleGoogleSignInException(GoogleSignInException error) {
    switch (error.code) {
      case GoogleSignInExceptionCode.canceled:
        return 'Proses masuk dengan Google dibatalkan.';
      case GoogleSignInExceptionCode.interrupted:
        return 'Proses masuk terganggu. Silakan coba lagi.';
      case GoogleSignInExceptionCode.clientConfigurationError:
        return 'Kesalahan konfigurasi client. Hubungi dukungan.';
      case GoogleSignInExceptionCode.providerConfigurationError:
        return 'Kesalahan konfigurasi saat masuk dengan Google. Hubungi dukungan.';
      default:
        return 'Terjadi kesalahan yang tidak diketahui saat masuk dengan Google.';
    }
  }
}
