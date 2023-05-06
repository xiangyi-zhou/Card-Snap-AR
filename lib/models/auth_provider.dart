import 'package:flutter/foundation.dart';
import 'package:card_snap_ar_client_side/controllers/auth_controller.dart';
import 'package:card_snap_ar_client_side/models/user.dart';

class AuthProvider extends ChangeNotifier {
  AuthController _authController = AuthController();

  MyUser? _currentUser;

  MyUser? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    final user = await _authController.login(email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signUp(String email, String password) async {
    final user = await _authController.signUp(email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signOut() async {
    final result = await _authController.signOut();
    if (result) {
      _currentUser = null;
      notifyListeners();
      return true;
    }
    return false;
  }

  // UNFINISHED FUNCTION
  Future<bool> updateUser(MyUser user) async {
    final result = await _authController.updateUser(user);
    if (result) {
      // _currentUser!.email = user.email;
      notifyListeners();
      return true;
    }
    return false;
  }
}
