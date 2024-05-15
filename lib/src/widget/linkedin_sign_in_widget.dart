import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wt_logging/wt_logging.dart';

class LinkedInSignInWidget extends StatelessWidget {
  static final log = logger(LinkedInSignInWidget, level: Level.debug);

  final VoidCallback? onSelect;
  const LinkedInSignInWidget({
    super.key,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _signIn,
      icon: const Icon(
        FontAwesomeIcons.linkedin,
        size: 16,
      ),
      label: const Text('LinkedIn'),
    );
  }

  Future<void> _signIn() async {
    onSelect?.call();
  }
}
