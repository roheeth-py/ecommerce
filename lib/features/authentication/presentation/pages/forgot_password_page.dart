import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/resources/app_navigator.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/pages/password_reset.dart';
import 'package:ecommerce/features/authentication/presentation/widget/forgot_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit sl = GetIt.instance<AuthCubit>();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: sl,
        listener: (context, state) {
          if (state is AuthForgotpasswordSuccessState) {
            print(1);
            AppNavigator.pushReplacement(context, const PasswordReset());
          } else if (state is AuthFailureState) {
            print(2);
            Fluttertoast.showToast(msg: state.failure.message);
          }
        },
        builder: (context, state) {
          bool isLoading = state is AuthLoadingState;
          return ForgotPasswordWidget(
            sl: sl,
            isLoading: isLoading,
          );
        },
      ),
    );
  }
}
