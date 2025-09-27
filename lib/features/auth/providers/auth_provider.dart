import 'package:drishtitech/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => statusUtils;

  String? errorMessage;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    Future.microtask(() {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    notifyListeners();
  }

  Future<void> loginPage(String email, String password) async {
    handleLoading();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);

      _isLoggedIn = true;
      handleSuccess();
    } catch (e) {
      errorMessage = e.toString();
      handleError();
    }
  }

  Future<void> signinPage(String email, String password) async {
    handleLoading();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
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
