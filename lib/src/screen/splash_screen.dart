import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: textTheme.displaySmall?.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
