import 'package:facebook_clo/config/themes/app_theme.dart';
import 'package:facebook_clo/core/screens/home_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/auth/presentation/screens/login_screen.dart';
import 'package:facebook_clo/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:facebook_clo/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          final user = FirebaseAuth.instance.currentUser;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.hasData) {
            if (user!.emailVerified) {
              return const HomeScreen();
            } else {
              //TODO: Need to be Fixed for Email Verification
              // shoud be VerifyEmailScreen instead
              return const VerifyEmailScreen();
            }
          }
          return const LoginScreen();
        }),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
