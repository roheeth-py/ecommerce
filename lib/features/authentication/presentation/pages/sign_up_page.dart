import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/resources/app_navigator.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthCubit sl = GetIt.instance<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: sl,
        listenWhen: (previous, current) => current is AuthActionState,
        buildWhen: (previous, current) => current is! AuthActionState,
        listener: (context, state) {
          if (state is AuthSuccessState) {
            AppNavigator.push(context, Scaffold(
              body: Text("data"),
            ));
          } else if (state is AuthFailureState) {
            Fluttertoast.showToast(msg: state.failure.message);
          }
        },
        builder: (context, state) {
          bool isLoading = state is AuthLoadingState;
          return SignUpWidget(sl: sl, isLoading: isLoading,);
        },
      ),
    );
  }
}
