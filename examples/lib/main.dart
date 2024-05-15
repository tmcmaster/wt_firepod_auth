import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wt_app_scaffold/app_platform/scaffold_app_dsl.dart';
import 'package:wt_firepod/wt_firepod.dart';
import 'package:wt_firepod_auth/wt_firepod_auth.dart';
import 'package:wt_firepod_auth_examples/screen/home_screen.dart';
import 'package:wt_firepod_auth_examples/screen/settings_screen.dart';
import 'package:wt_firepod_auth_examples/secrets/examples_app_secrets.dart';
import 'package:wt_firepod_auth_examples/secrets/firebase_options.dart';

void main() {
  setHashUrlStrategy();
  runMyApp(
    withFirebase(
      asPlainApp(
        AuthenticationWrapper(
          app: MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (_) => const HomeScreen(),
              '/settings': (_) => const SettingsScreen(),
            },
          ),
        ),
      ),
      appName: 'wt-firepod-auth',
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    ),
    includeOverrides: [
      AuthenticationStore.appSecrets.overrideWith(
        (ref) => ExamplesAppSecrets(),
      ),
    ],
  );
}
