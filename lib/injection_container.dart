import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/features/authentication/data/data_source/data_source.dart';
import 'package:ecommerce/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_in_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_up_usecase.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce/features/home/data/data_source/data.dart';
import 'package:ecommerce/features/home/data/data_source/data_impl.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo_impl.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerce/features/home/domain/usecase/get_data_usecase.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  serviceLocator
      .registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  serviceLocator
      .registerSingleton<FirebaseAuthDataSource>(FirebaseAuthDataSource());
  serviceLocator.registerSingleton<FirebaseFirestoreDataSource>(
      FirebaseFirestoreDataSource());

  serviceLocator.registerSingleton<AuthRepository>(
      AuthRepositoryImplementation(serviceLocator()));

  serviceLocator
      .registerSingleton<SignInUsecase>(SignInUsecase(serviceLocator()));

  serviceLocator.registerSingleton<SignUpUsecase>(
      SignUpUsecase(serviceLocator(), serviceLocator()));

  serviceLocator.registerSingleton<ForgotPasswordUsecase>(
      ForgotPasswordUsecase(serviceLocator()));

  serviceLocator.registerFactory<AuthCubit>(() {
    return AuthCubit(serviceLocator(), serviceLocator(), serviceLocator());
  });
//
//
  serviceLocator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: "https://ecommerce-409c2-default-rtdb.firebaseio.com",
        headers: {"Content-Type": "application/json"},
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    ),
  );

  serviceLocator
      .registerSingleton<FirebaseDataSource>(FirebaseDataSourceImpl());
  serviceLocator.registerSingleton<HomeRepo>(
      HomeRepoImpl(firebaseDataSource: serviceLocator()));
  serviceLocator.registerSingleton<GetDataUsecase>(
      GetDataUsecase(homeRepo: serviceLocator()));
  serviceLocator.registerFactory<HomeCubit>(
    () {
      return HomeCubit(serviceLocator());
    },
  );
}
