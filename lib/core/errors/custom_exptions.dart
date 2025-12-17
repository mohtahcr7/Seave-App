import 'package:seave/core/services/firebase_auth_service.dart';

class CustomExceptions implements Exception {
  final String message;
  final AuthErrorCode? code;

  CustomExceptions({required this.message, this.code});

  @override
  String toString() => 'CustomException: $message';
}
