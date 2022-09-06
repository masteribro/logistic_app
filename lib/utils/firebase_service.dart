import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid): null;
  }
  Stream<UserModel?> get user {
    return _auth.authStateChanges()
    .map((User? user) => _userFromFirebaseUser(user));
    //     .map(_userFromFirebaseUser);
  }
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return  _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential  result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}