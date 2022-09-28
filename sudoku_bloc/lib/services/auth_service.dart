import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String> signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    if (userCredential.user != null) {
      return userCredential.user!.uid;
    }

    return '';
  }

  String userId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
