import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  Future<bool> connectToFirebase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA5bz_STW_DJ0vioh4vXLDCxAzgIJOtJ3o',
        appId: '1:195974345609:android:42aa0853dfbab7b47c2758',
        messagingSenderId: '195974345609',
        projectId: 'em-sudoku',
      ),
    );

    return true;
  }
}
