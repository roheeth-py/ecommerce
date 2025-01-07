import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/data/data_source/data_source.dart';
import 'package:ecommerce/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_in_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_up_usecase.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  serviceLocator
      .registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  serviceLocator
      .registerSingleton<FirebaseAuthDataSource>(FirebaseAuthDataSource());
  serviceLocator
      .registerSingleton<FirebaseFirestoreDataSource>(FirebaseFirestoreDataSource());

  serviceLocator.registerSingleton<AuthRepository>(
      AuthRepositoryImplementation(serviceLocator()));

  serviceLocator
      .registerSingleton<SignInUsecase>(SignInUsecase(serviceLocator()));

  serviceLocator
      .registerSingleton<SignUpUsecase>(SignUpUsecase(serviceLocator(), serviceLocator()));

  serviceLocator
      .registerSingleton<ForgotPasswordUsecase>(ForgotPasswordUsecase(serviceLocator()));

  serviceLocator.registerFactory<AuthCubit>(() {
    return AuthCubit(serviceLocator(), serviceLocator(), serviceLocator());
  });
}
