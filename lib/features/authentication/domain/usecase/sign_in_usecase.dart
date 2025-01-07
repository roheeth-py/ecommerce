import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/features/authentication/data/model/user_model.dart';
import 'package:ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class SignInUsecase extends UseCase<UserEntity, SignInParams>{
  SignInUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams param) async {
    final serviceLocator = GetIt.instance<FirebaseFirestore>();
    try{
      User? user =  await authRepository.signIn(param.email, param.password);
      if(user!=null){
        final path = await serviceLocator.collection("users").doc("${user.uid}").get();
        final userEntity = UserModel.fromFirebase(path);
        return Right(userEntity);
      }else{
        return Left(ServerFailure(message: "User not found"));
      }
    }catch(e){
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
