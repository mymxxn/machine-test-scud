import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_scrud_networks/View/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () => Get.offAll(() => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height / 3,
          width: size.height / 3,
          alignment: Alignment.center,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
