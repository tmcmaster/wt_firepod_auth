import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wt_firepod_auth/src/widget/linkedin_sign_in_widget.dart';
import 'package:wt_firepod_auth/wt_firepod_auth.dart';
import 'package:wt_logging/wt_logging.dart';

enum LoginType {
  email,
  google,
  apple,
  microsoft,
  github,
  phone,
  linkedIn,
}

class LoginScreen extends ConsumerStatefulWidget {
  static final log = logger(LoginScreen, level: Level.debug);

  final List<LoginType> loginTypes;

  const LoginScreen({
    super.key,
    this.loginTypes = const [
      LoginType.email,
      LoginType.google,
      LoginType.apple,
      LoginType.microsoft,
      LoginType.github,
      LoginType.phone,
      LoginType.linkedIn,
    ],
  });

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  LoginType? loginType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Login Screen',
              style: textTheme.displaySmall?.copyWith(
                color: Colors.red,
              ),
            ),
            if (loginType == null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 4,
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  children: [
                    if (widget.loginTypes.contains(LoginType.email))
                      ElevatedButton.icon(
                        onPressed: _emailSignIn,
                        icon: const Icon(
                          Icons.email,
                          size: 16,
                        ),
                        label: const Text('Email'),
                      ),
                    if (widget.loginTypes.contains(LoginType.google))
                      ElevatedButton.icon(
                        onPressed: _googleSignIn,
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          size: 16,
                        ),
                        label: const Text('Google'),
                      ),
                    if (widget.loginTypes.contains(LoginType.apple))
                      ElevatedButton.icon(
                        onPressed: _appleSignIn,
                        icon: const Icon(
                          FontAwesomeIcons.apple,
                          size: 16,
                        ),
                        label: const Text('Apple'),
                      ),
                    if (widget.loginTypes.contains(LoginType.microsoft))
                      ElevatedButton.icon(
                        onPressed: _microsoftSignIn,
                        icon: const Icon(
                          FontAwesomeIcons.microsoft,
                          size: 16,
                        ),
                        label: const Text('Microsoft'),
                      ),
                    if (widget.loginTypes.contains(LoginType.phone))
                      ElevatedButton.icon(
                        onPressed: _phoneSignIn,
                        icon: const Icon(
                          FontAwesomeIcons.phone,
                          size: 16,
                        ),
                        label: const Text('Phone'),
                      ),
                    if (widget.loginTypes.contains(LoginType.github))
                      ElevatedButton.icon(
                        onPressed: _githubSignIn,
                        icon: const Icon(
                          FontAwesomeIcons.github,
                          size: 16,
                        ),
                        label: const Text('GitHub'),
                      ),
                    if ((loginType == null || loginType == LoginType.linkedIn) &&
                        widget.loginTypes.contains(LoginType.linkedIn))
                      LinkedInSignInWidget(
                        onSelect: () => setState(() {
                          loginType = LoginType.linkedIn;
                        }),
                      ),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: () async {
                final appSecrets = ref.read(AuthenticationStore.appSecrets);

                ref.read(AuthenticationService.provider).signInWithEmail(
                      email: appSecrets.email,
                      password: appSecrets.password,
                    );

                Navigator.of(context).pushReplacementNamed('/splash');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _emailSignIn() async {
    setState(() {
      loginType = LoginType.email;
    });
  }

  Future<void> _googleSignIn() async {}
  Future<void> _appleSignIn() async {}
  Future<void> _microsoftSignIn() async {}
  Future<void> _phoneSignIn() async {}
  Future<void> _githubSignIn() async {}
}
