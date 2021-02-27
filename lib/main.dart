import 'package:flutter/material.dart';

import 'screens/splashScreen/SplashScreen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'iranSanc'),
    home: SplashScreen(),
  ));
}

