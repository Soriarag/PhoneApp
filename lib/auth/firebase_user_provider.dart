import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VisALFirebaseUser {
  VisALFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

VisALFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VisALFirebaseUser> visALFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VisALFirebaseUser>((user) => currentUser = VisALFirebaseUser(user));
