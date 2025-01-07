import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/resources/app_navigator.dart';
import 'package:ecommerce/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({super.key, required this.sl, required this.isLoading});
  final AuthCubit sl;
  final bool isLoading;

  final Key globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 60.h, right: 20.w),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.primary,
              ),
              child: IconButton(
                  onPressed: () {
                    AppNavigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16.w,
                  )),
            ),
            20.verticalSpace,
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.verticalSpace,
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "Email Address"),
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
                  await sl.forgotPassword(email);
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
          ],
        ),
      ),
    );
  }
}
