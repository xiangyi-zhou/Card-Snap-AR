import 'package:firebase_auth/firebase_auth.dart';
import 'package:card_snap_ar_client_side/models/user.dart';


class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<MyUser?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return MyUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<MyUser?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return MyUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> updateUser(MyUser user) async {
    try {
      await _firebaseAuth.currentUser!.updateEmail(user.email);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }
}
