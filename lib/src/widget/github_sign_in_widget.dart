import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wt_logging/wt_logging.dart';

class GitHubSignInWidget extends StatelessWidget {
  static final log = logger(GitHubSignInWidget, level: Level.debug);

  final VoidCallback? onTap;
  const GitHubSignInWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _signIn,
      icon: const Icon(
        FontAwesomeIcons.linkedin,
        size: 16,
      ),
      label: const Text('GitHub'),
    );
  }

  Future<void> _signIn() async {
    onTap?.call();
  }
}
