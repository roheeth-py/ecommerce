import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/features/authentication/data/data_source/data_source.dart';
import 'package:ecommerce/features/authentication/data/model/user_model.dart';
import 'package:ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUsecase extends UseCase<UserEntity, SignUpParams> {
  final AuthRepository _authRepository;
  final FirebaseFirestoreDataSource firebaseFirestoreDataSource;
  SignUpUsecase(this._authRepository, this.firebaseFirestoreDataSource);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams param) async {
    try {
      User? user = await _authRepository.signUp(param.email, param.password);
      if (user != null) {
        UserEntity userEntity = UserModel.toFirebase(
            name: param.name, email: param.email, uid: user.uid);
        await firebaseFirestoreDataSource.createUser(UserModel(
            uid: userEntity.uid,
            email: userEntity.email,
            name: userEntity.name));
        return Right(userEntity);
      } else {
        return Left(ServerFailure(message: "Unable to SignUp"));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams(
      {required this.name, required this.email, required this.password});
}
