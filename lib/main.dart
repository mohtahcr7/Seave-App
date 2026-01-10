import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seave/core/helper_functions/on_generate_routes.dart';
import 'package:seave/core/services/get_it_service.dart';
import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/feature/auth/presentation/views/login_view.dart';
import 'package:seave/firebase_options.dart';
import 'package:seave/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize SharedPreferences
  await Prefs.init();

  // Setup GetIt services
  setupGetIt();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit يضمن init قبل استخدام أي قياسات w, h, sp
    return ScreenUtilInit(
      designSize: const Size(393, 852), // حجم التصميم الأصلي
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // RTL
          child: MaterialApp(
            // showPerformanceOverlay: true,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Tajawal'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'), // لضمان RTL
            onGenerateRoute: onGenetrateRoute,
            initialRoute: LoginView.routeName,
            // حذف home لتفادي أي تعارض مع initialRoute
          ),
        );
      },
    );
  }
}
