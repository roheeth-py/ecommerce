import 'package:ecommerce/core/resources/app_navigator.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWidget extends StatelessWidget {
  SignInWidget({super.key, required this.sl, required this.isLoading});

  final Key globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthCubit sl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sign in",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.verticalSpace,
          Form(
            key: globalKey,
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email Address"),
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          10.verticalSpace,
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Password"),
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
          15.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                String email = emailController.text;
                String password = passwordController.text;
                await sl.signIn(email, password);
              },
              child: isLoading
                  ? const Center(
                child: CupertinoActivityIndicator(),
              )
                  : const Text(
                "Continue",
              ),
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              const Text("Don't have an Account ?"),
              TextButton(onPressed: () {
                AppNavigator.push(context, SignUpPage());
              }, child: const Text("Create One")),
            ],
          )
        ],
      ),
    );
  }
}
