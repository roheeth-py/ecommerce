import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/features/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/features/authentication/domain/usecase/forgot_password_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_in_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecase/sign_up_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.signInUsecase, this.signUpUsecase, this.forgotPasswordUsecase) : super(AuthInitialState());

  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;

  Future<void> signIn(String email, String password) async {
    emit(AuthLoadingState());

    final Either<Failure, UserEntity> result = await signInUsecase(
      SignInParams(email: email, password: password),
    );

    result.fold(
      (failure) {
        emit(AuthFailureState(failure: failure));
      },
      (user) {
        emit(AuthSuccessState(user: user));
      },
    );
  }

  Future<void> signUp(
      String email, String password, String name) async {
    emit(AuthLoadingState());

    final Either<Failure, UserEntity> result = await signUpUsecase(
        SignUpParams(email: email, password: password, name: name));
    result.fold(
      (failure) {
        emit(AuthFailureState(failure: failure));
      },
      (user) {
        emit(AuthSuccessState(user: user));
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoadingState());
    final Either<Failure, String> result = await forgotPasswordUsecase(email);
    result.fold((failure){
      emit(AuthFailureState(failure: failure));
    }, (done){
      emit(AuthForgotpasswordSuccessState());
    });
  }
}
