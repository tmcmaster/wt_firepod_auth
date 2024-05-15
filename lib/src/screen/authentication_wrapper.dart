import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_firepod/wt_firepod.dart';
import 'package:wt_firepod_auth/src/screen/authentication_screens.dart';
import 'package:wt_firepod_auth/src/store/authentication_store.dart';

class AuthenticationWrapper extends ConsumerWidget {
  final Widget app;
  const AuthenticationWrapper({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(AuthenticationStore.user);
    return MaterialApp(
      home: user == null ? const AuthenticationScreens() : app,
    );
  }
}
