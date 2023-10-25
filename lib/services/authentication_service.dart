import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      print ("Trying");
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      await user?.updateDisplayName(username); // Update user's display name (username)
      await user?.sendEmailVerification();
      return "Registered";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
