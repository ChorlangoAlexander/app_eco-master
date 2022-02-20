import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {
  static Future<User?> IniciarSesionGoogle(
      {required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;
    GoogleSignIn obGoogleSignIn = GoogleSignIn();
    GoogleSignInAccount? obGoogleSignInAccount = await obGoogleSignIn.signIn();

    if (obGoogleSignInAccount != null) {
      GoogleSignInAuthentication obGoogleSignInAuthentication =
          await obGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: obGoogleSignInAuthentication.accessToken,
          idToken: obGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print('Error en el ingreso');
      }
    }
  }
}
