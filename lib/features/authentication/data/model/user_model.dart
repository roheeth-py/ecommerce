import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String uid;
  @override
  final String email;
  @override
  final String name;
  String? address;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
  }) : super(uid: uid, email: email, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  factory UserModel.toFirebase({required String name, required String email, required String uid}) {
    return UserModel(
      uid: uid,
      email: email,
      name: name,
    );
  }

  factory UserModel.fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      uid: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, "name": name};
  }
}
