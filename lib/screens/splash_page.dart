import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_page.dart';
import '../global/dimens.dart';
import '../widgets/etiqa_loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // This delay just to simulate any fetching process for the splash
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Get.offAll(
        const HomePage(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EtiqaLoadingWidget(),
            Text(
              'Welcome...',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.h5),
            )
          ],
        ),
      ),
    );
  }
}
