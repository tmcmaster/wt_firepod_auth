import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_firepod_auth/src/screen/login_screen.dart';
import 'package:wt_firepod_auth/src/screen/splash_screen.dart';

class AuthenticationScreens extends ConsumerWidget {
  const AuthenticationScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/': (_) => const LoginScreen(),
      },
    );
  }
}
