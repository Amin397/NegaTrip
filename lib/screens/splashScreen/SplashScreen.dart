import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nega_trip/Helpers/NavHelper.dart';
import 'package:nega_trip/screens/dashboard/DashBoard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Size size;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      NavHelper.pushR(context, DashboardScreen());
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: Lottie.asset('assets/anim/splash.json'),
            ),
          ),
        ),
      ),
    );
  }
}
