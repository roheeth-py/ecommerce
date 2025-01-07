import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/authentication/presentation/widget/sign_in_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final AuthCubit sl = GetIt.instance<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: sl,
        builder: (context, state) {
          bool isLoading = state is AuthLoadingState;
          return SignInWidget(
              sl: sl, isLoading: isLoading);
        },
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(child: Text("Done")),
                ),
              ),
            );
          } else if (state is AuthFailureState) {
            Fluttertoast.showToast(msg: state.failure.message);
          }
        },
      ),
    );
  }
}

// // BlocConsumer<AuthCubit, AuthState>(
// // bloc: sl,
// // builder: (context, state) {
// // bool isLoading = state is AuthLoadingState;
// // return SignInWidget(sl: context.read<AuthCubit>(), isLoading: isLoading);
// // },
// // listener: (context, state) {
// // if (state is AuthSuccessState) {
// // Navigator.of(context).push(
// // MaterialPageRoute(
// // builder: (context) => const Scaffold(
// // body: Center(child: Text("Done")),
// // ),
// // ),
// // );
// // } else if (state is AuthFailureState) {
// // Fluttertoast.showToast(msg: state.failure.message);
// // }
// // },
// // ),
