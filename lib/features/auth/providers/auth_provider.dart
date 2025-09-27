import 'package:drishtitech/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => statusUtils;

  String? errorMessage;

  Future<void> loginPage(String email, String password) async {
    handleLoading();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      handleSuccess();
    } catch (e) {
      errorMessage = e.toString();
      handleError();
    }
  }

  handleLoading() {
    _statusUtils = StatusUtils.loading;
    notifyListeners();
  }

  handleSuccess() {
    _statusUtils = StatusUtils.success;
    notifyListeners();
  }

  handleError() {
    _statusUtils = StatusUtils.error;
    notifyListeners();
  }
}
