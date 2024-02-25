import 'package:firebase_auth/firebase_auth.dart';
import 'package:victordetailsflutter/src/models/user.dart';
import 'package:victordetailsflutter/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = fire


  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


  @override
  Stream<User?> get user => throw UnimplementedError();

  @override
  Future<MyUser> signIn(String email, String password) {
    throw UnimplementedError();
  }


  @override
  Future<MyUser> signUp(MyUser myUser, String password) {
    throw UnimplementedError();
  }
  @override
  Future<MyUser> setUserData(MyUser user) {
    throw UnimplementedError();
  }
}