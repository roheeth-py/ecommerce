import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/features/authentication/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

abstract class AuthDataSource {
  Future<User?> signIn(String email, String password);
  Future<void> forgetPassword(String email);
  Future<User?> signUp(String email, String password);
  Future<void> signOut();
}

abstract class FireStoreDataSource{
  Future<void> createUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> updateUser();
  Future<void> deleteUser();
}

class FirebaseAuthDataSource implements AuthDataSource {
  FirebaseAuth firebase = GetIt.instance<FirebaseAuth>();

  @override
  Future<User?> signIn(String email, String password) async {
    // TODO: implement signIn
    try {
      UserCredential userCredential = await firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception("Firebase sign-in failed: $e");
    }
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    try {
      await firebase.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(message: e.message ?? "Sign-out failed");
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    // TODO: implement forgetPassword
    try {
      await firebase.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    // TODO: implement signUp
    try{
      UserCredential user = await firebase.createUserWithEmailAndPassword(email: email, password: password);
      return user.user;
    }catch(e){
      throw ServerFailure(message: e.toString());
    }
  }
}

class FirebaseFirestoreDataSource extends FireStoreDataSource{
  FirebaseFirestore firestore = GetIt.instance<FirebaseFirestore>();
  @override
  Future<void> createUser(UserModel user) async {
    // TODO: implement createUser
    await firestore.collection("users").doc(user.uid).set({
      "uid" : user.uid,
      "name" : user.name,
      "email" : user.email,
    });
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
