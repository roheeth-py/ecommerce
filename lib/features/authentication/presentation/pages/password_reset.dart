import 'package:ecommerce/core/resources/app_navigator.dart';
import 'package:ecommerce/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:ecommerce/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/vectors/email_sending.svg"),
            35.verticalSpace,
            Text(
              "We Sent you an Email to reset\nyour password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            25.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  AppNavigator.pushReplacement(context, SignInPage());
                },
                child: const Text("Return to Login")),
          ],
        ),
      ),
    );
  }
}
