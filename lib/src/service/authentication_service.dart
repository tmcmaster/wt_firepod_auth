import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wt_firepod/wt_firepod.dart';
import 'package:wt_firepod_auth/src/store/authentication_store.dart';

class AuthenticationService {
  static final provider = Provider(
    name: 'AuthenticationService.provider',
    (ref) => AuthenticationService(ref),
  );

  final Ref ref;

  AuthenticationService(this.ref);

  Stream<User?> authStream() {
    return ref.read(FirebaseProviders.auth).authStateChanges();
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await ref.read(FirebaseProviders.auth).signInWithEmailAndPassword(
          email: email,
          password: password,
        );
    return credential.user;
  }

  Future<void> signOut() async {
    ref.read(FirebaseProviders.auth).signOut();
  }

  Future<User?> signInWithGoogle() async {
    final webClientId = ref.read(AuthenticationStore.appSecrets).webClientId;

    final GoogleSignInAccount? account = await GoogleSignIn(
      clientId: webClientId,
    ).signIn();

    if (account != null) {
      final GoogleSignInAuthentication authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      final userCredentials =
          await ref.read(FirebaseProviders.auth).signInWithCredential(credential);

      return userCredentials.user;
    }

    return null;
  }
}
