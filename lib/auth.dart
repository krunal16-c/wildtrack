/// Name - WildTrack app for tracking wildlife.
/// Solving sustainable goals number 11 and 15
/// Author - Krunal Chavda
/// Please credit the work if you are using it.



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wildtrack/home.dart';
import 'login.dart';
import 'main.dart';

class AuthService{
  // handle auth state
  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if (snapshot.hasData){
            return HomePage();
          }else{
            return const LoginPage();
          }
        }
        );
  }
// sign in with google
  signInWithGoogle() async {
    // Trigger the auth flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // once signed in return the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
// signOut
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}