import 'package:ecommerce/config/theme/app_theme.dart';
import 'package:ecommerce/core/resources/error_page.dart';
import 'package:ecommerce/core/resources/loading_page.dart';
import 'package:ecommerce/features/authentication/presentation/pages/password_reset.dart';
import 'package:ecommerce/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:ecommerce/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  FlutterNativeSplash.remove();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.appTheme,
        title: "SK Store",
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const LoadingPage();
            }else if(snapshot.hasData){
              return HomePage();
            }else if(snapshot.hasError){
              return const ErrorPage();
            }else{
              return SignInPage();
            }
          },
        ),
      ),
    );
  }
}
