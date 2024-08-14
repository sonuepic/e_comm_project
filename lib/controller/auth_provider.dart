import 'package:e_comm_project/utils/custom_toast.dart';
import 'package:e_comm_project/view/product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Future<void> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      var emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      RegExp passwordValid = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (name == '') {
        errorToast('Name field is empty?');
      } else if (email == '') {
        errorToast('Email field is empty?');
      } else if (!emailValid.hasMatch(email)) {
        errorToast('Invalid email Entered!');
      } else if (password == '') {
        errorToast('Password field is empty!');
      } else if (!passwordValid.hasMatch(password)) {
        errorToast('Invalid password entered!');
      } else {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'name': name,
          'email': email,
        });
        if (userCredential.user?.uid != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const ProductsPage()));
        } else {
          errorToast('Oops Something went wrong?');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      var emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      RegExp passwordValid = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (email == '') {
        errorToast('Email field is empty?');
      } else if (!emailValid.hasMatch(email)) {
        errorToast('Invalid email Entered!');
      } else if (password == '') {
        errorToast('Password field is empty!');
      } else if (!passwordValid.hasMatch(password)) {
        errorToast('Invalid password entered!');
      } else {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (userCredential.user?.uid != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const ProductsPage()));
        } else {
          errorToast('Oops Something went wrong?');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        errorToast(e.toString());
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
