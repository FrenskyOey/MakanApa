import 'dart:io';

import 'package:dio/dio.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';

class DioErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is DioException) {
      return switch (error.type) {
        // A. Low-Level Network Failures
        DioExceptionType.connectionTimeout =>
          'Waktu koneksi habis. Periksa jaringan Anda.',
        DioExceptionType.sendTimeout => 'Waktu pengiriman permintaan habis.',
        DioExceptionType.receiveTimeout => 'Waktu menerima respons habis.',
        DioExceptionType.connectionError =>
          (error.error is SocketException)
              ? 'Tidak ada koneksi internet. Silakan periksa pengaturan jaringan Anda.'
              : 'Koneksi gagal karena kesalahan jaringan.',

        // B. HTTP Status Code Errors
        DioExceptionType.badResponse => _handleBadResponse(error),

        // C. Cancellation / Security / Unknown
        DioExceptionType.cancel => 'Permintaan jaringan dibatalkan.',
        DioExceptionType.badCertificate =>
          'Koneksi aman gagal karena sertifikat keamanan tidak valid.',
        DioExceptionType.unknown =>
          (error.error is FormatException)
              ? 'Kesalahan format data: Respons server tidak dapat dibaca.'
              : 'Terjadi kesalahan yang tidak diketahui saat komunikasi.',
      };
    }
    return 'Terjadi kesalahan tak terduga. Silakan coba lagi.';
  }

  String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        return 'Permintaan Buruk: Data yang dikirim tidak valid.';
      case 401:
        return 'Sesi Login Habis, silahkan login lagi.';
      case 403:
        return 'Dilarang: Anda tidak memiliki izin untuk mengakses sumber daya ini.';
      case 404:
        return 'Url Api Tidak ditemukan.';
      case 422:
        return 'Validasi Gagal: Permintaan tidak dapat diproses.';
      case 500:
        return 'Kesalahan Server Internal: Server kami sedang mengalami masalah.';
      case 503:
        return 'Layanan Tidak Tersedia: Silakan coba lagi sebentar.';
      default:
        return 'Kesalahan server dengan kode status: $statusCode.';
    }
  }
}
