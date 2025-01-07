import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Future<User?> signIn(String email, String password);
  Future<void> forgetPassword(String email);
  Future<User?> signUp(String email, String password);
  Future<void> signOut();
}