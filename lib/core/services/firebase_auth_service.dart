import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seave/core/errors/custom_exptions.dart';

enum AuthErrorCode {
  // Email & Password
  weakPassword,
  emailAlreadyInUse,
  invalidEmail,
  userNotFound,
  wrongPassword,

  // Google Sign-In
  canceled,
  network,
  invalidCredential,
  userDisabled,

  // General
  unknown,
}

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future deleteUser() async {
    await _auth.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw CustomExceptions(
          message: 'لم يتم إنشاء الحساب، حاول مرة أخرى.',
          code: AuthErrorCode.unknown,
        );
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Register exception: ${e.code}');

      switch (e.code) {
        case 'weak-password':
          throw CustomExceptions(
            message: 'كلمة المرور ضعيفة جدًا.',
            code: AuthErrorCode.weakPassword,
          );

        case 'email-already-in-use':
          throw CustomExceptions(
            message: 'هذا البريد الإلكتروني مستخدم بالفعل.',
            code: AuthErrorCode.emailAlreadyInUse,
          );

        case 'invalid-email':
          throw CustomExceptions(
            message: 'صيغة البريد الإلكتروني غير صحيحة.',
            code: AuthErrorCode.invalidEmail,
          );

        case 'operation-not-allowed':
          throw CustomExceptions(
            message: 'هذا النوع من التسجيل غير مفعّل في النظام.',
            code: AuthErrorCode.unknown,
          );

        case 'network-request-failed':
          throw CustomExceptions(
            message: 'تأكد من اتصالك بالإنترنت.',
            code: AuthErrorCode.unknown,
          );

        default:
          throw CustomExceptions(
            message: e.message ?? 'حدث خطأ غير متوقع أثناء إنشاء الحساب.',
            code: AuthErrorCode.unknown,
          );
      }
    } catch (e) {
      throw CustomExceptions(
        message: 'حدث خطأ ما، حاول مرة أخرى لاحقًا.',
        code: AuthErrorCode.unknown,
      );
    }
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      if (credential.user == null) {
        throw CustomExceptions(
          message: 'لم يتم تسجيل الدخول، حاول مرة أخرى.',
          code: AuthErrorCode.unknown,
        );
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Login exception: ${e.code}');

      switch (e.code) {
        case 'invalid-email':
          throw CustomExceptions(
            message: 'البريد الإلكتروني غير صالح.',
            code: AuthErrorCode.invalidEmail,
          );

        case 'user-not-found':
          throw CustomExceptions(
            message: 'لا يوجد مستخدم بهذا البريد الإلكتروني.',
            code: AuthErrorCode.userNotFound,
          );

        case 'wrong-password':
          throw CustomExceptions(
            message: 'كلمة المرور غير صحيحة.',
            code: AuthErrorCode.wrongPassword,
          );

        case 'user-disabled':
          throw CustomExceptions(
            message: 'هذا الحساب تم تعطيله.',
            code: AuthErrorCode.unknown,
          );

        case 'too-many-requests':
          throw CustomExceptions(
            message: 'عدد محاولات كبير، يرجى المحاولة لاحقًا.',
            code: AuthErrorCode.unknown,
          );

        case 'network-request-failed':
          throw CustomExceptions(
            message: 'تأكد من اتصالك بالإنترنت.',
            code: AuthErrorCode.unknown,
          );

        default:
          throw CustomExceptions(
            message: 'حدث خطأ غير متوقع. حاول مرة أخرى.',
            code: AuthErrorCode.unknown,
          );
      }
    } catch (e) {
      throw CustomExceptions(
        message: 'حدث خطأ أثناء تسجيل الدخول، حاول لاحقًا.',
        code: AuthErrorCode.unknown,
      );
    }
  }

  Future<User> loginInWithGoogle() async {
    try {
      // Start Google sign-in flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw CustomExceptions(
          message: 'تم إلغاء تسجيل الدخول عبر Google.',
          code: AuthErrorCode.unknown,
        );
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      return (await _auth.signInWithCredential(credential)).user!;
    }
    // 🔴 أخطاء Firebase
    on FirebaseAuthException catch (e) {
      log('Firebase Google error: ${e.code}');

      switch (e.code) {
        case 'account-exists-with-different-credential':
          throw CustomExceptions(
            message: 'هذا البريد مسجل بطريقة تسجيل مختلفة.',
            code: AuthErrorCode.invalidCredential,
          );

        case 'user-disabled':
          throw CustomExceptions(
            message: 'تم تعطيل هذا الحساب.',
            code: AuthErrorCode.userDisabled,
          );

        case 'network-request-failed':
          throw CustomExceptions(
            message: 'تحقق من اتصال الإنترنت.',
            code: AuthErrorCode.network,
          );

        default:
          throw CustomExceptions(
            message: 'فشل تسجيل الدخول عبر Google.',
            code: AuthErrorCode.unknown,
          );
      }
    }
    // 🔴 أخطاء Google SDK
    on PlatformException catch (e) {
      log('Google platform error: ${e.code}');

      if (e.code == 'network_error') {
        throw CustomExceptions(
          message: 'لا يوجد اتصال بالإنترنت.',
          code: AuthErrorCode.network,
        );
      }

      throw CustomExceptions(
        message: 'تم إلغاء تسجيل الدخول.',
        code: AuthErrorCode.canceled,
      );
    }
    // 🔴 أي خطأ تاني
    catch (e) {
      throw CustomExceptions(
        message: 'حدث خطأ غير متوقع.',
        code: AuthErrorCode.unknown,
      );
    }
  }

  Future<User> loginInWithFacebook() async {
    try {
      // Start Facebook login
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // ❌ المستخدم لغى العملية
      if (loginResult.status == LoginStatus.cancelled) {
        throw CustomExceptions(
          message: 'تم إلغاء تسجيل الدخول عبر Facebook.',
          code: AuthErrorCode.canceled,
        );
      }

      // ❌ فشل تسجيل الدخول
      if (loginResult.status == LoginStatus.failed) {
        throw CustomExceptions(
          message: loginResult.message ?? 'فشل تسجيل الدخول عبر Facebook.',
          code: AuthErrorCode.unknown,
        );
      }

      // ❌ مفيش Access Token
      final accessToken = loginResult.accessToken;
      if (accessToken == null) {
        throw CustomExceptions(
          message: 'فشل التحقق من حساب Facebook.',
          code: AuthErrorCode.invalidCredential,
        );
      }

      // Create Firebase credential
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.tokenString,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (userCredential.user == null) {
        throw CustomExceptions(
          message: 'لم يتم تسجيل الدخول، حاول مرة أخرى.',
          code: AuthErrorCode.unknown,
        );
      }

      return userCredential.user!;
    }
    // 🔴 Firebase errors
    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          throw CustomExceptions(
            message: 'هذا البريد مسجل بطريقة تسجيل مختلفة.',
            code: AuthErrorCode.invalidCredential,
          );

        case 'user-disabled':
          throw CustomExceptions(
            message: 'تم تعطيل هذا الحساب.',
            code: AuthErrorCode.userDisabled,
          );

        case 'network-request-failed':
          throw CustomExceptions(
            message: 'تحقق من اتصال الإنترنت.',
            code: AuthErrorCode.network,
          );

        default:
          throw CustomExceptions(
            message: e.message ?? 'حدث خطأ أثناء تسجيل الدخول عبر Facebook.',
            code: AuthErrorCode.unknown,
          );
      }
    }
    // 🔴 Facebook SDK errors
    on PlatformException catch (e) {
      throw CustomExceptions(
        message: e.message ?? 'حدث خطأ في Facebook.',
        code: AuthErrorCode.unknown,
      );
    }
    // 🔴 أي خطأ غير متوقع
    catch (e) {
      throw CustomExceptions(
        message: 'حدث خطأ غير متوقع.',
        code: AuthErrorCode.unknown,
      );
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
