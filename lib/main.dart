import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../screens/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EtiqaIV());
}

class EtiqaIV extends StatelessWidget {
  const EtiqaIV({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Etiqa Interview App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
            primarySwatch: AppColors.mainColorWithSwatch,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColors.accentColor,
            ),
          ),
          home: const SplashPage(),
        );
      },
    );
  }
}
