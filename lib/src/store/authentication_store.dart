import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_firepod/wt_firepod.dart';
import 'package:wt_firepod_auth/src/model/app_secrets_interface.dart';
import 'package:wt_firepod_auth/src/service/authentication_service.dart';
import 'package:wt_logging/wt_logging.dart';

mixin AuthenticationStore {
  static final appSecrets = Provider<AppSecretsInterface>(
    name: 'AuthenticationStore.appSecrets',
    (ref) => throw Exception(
      'AuthenticationStore.appSecrets needs to be overridden',
    ),
  );

  static final user = StateNotifierProvider<UserStateNotifier, User?>(
    name: 'AuthenticationStore.user',
    (ref) => UserStateNotifier(ref),
  );
}

class UserStateNotifier extends StateNotifier<User?> {
  static final log = logger(UserStateNotifier, level: Level.warning);

  final Ref ref;

  UserStateNotifier(this.ref) : super(null) {
    ref.read(AuthenticationService.provider).authStream().listen((user) {
      log.i('User authentication changed: $user');
      state = user;
    });
  }
}
