import 'package:ecommerce/features/authentication/data/data_source/data_source.dart';
import 'package:ecommerce/features/authentication/data/model/user_model.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImplementation extends AuthRepository {
  AuthRepositoryImplementation(this._authDataSource);

  final FirebaseAuthDataSource _authDataSource;
  @override
  Future<User?> signIn(String email, String password) async {
    // TODO: implement signIn
    return await _authDataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    return await _authDataSource.signOut();
  }

  @override
  Future<void> forgetPassword(String email) async {
    // TODO: implement forgetPassword
    return await _authDataSource.forgetPassword(email);
  }

  @override
  Future<User?> signUp(String email, String password) async {
    // TODO: implement signUp
    return await _authDataSource.signUp(email, password);
  }
}
