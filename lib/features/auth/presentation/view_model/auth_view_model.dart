import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel {
  static Future createAuthUser() async {
    late OAuthCredential credential;
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      log("user not null");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
