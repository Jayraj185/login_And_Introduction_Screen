import 'package:flutter/material.dart';
import 'package:login/screens/CreateScreen/provider/CreateProvider.dart';
import 'package:login/screens/CreateScreen/view/CreatePage.dart';
import 'package:login/screens/HomeScreen/view/HomePage.dart';
import 'package:login/screens/IntroScreen/view/IntroPage.dart';
import 'package:login/screens/LoginScreen/provider/LoginProvider.dart';
import 'package:login/screens/LoginScreen/view/LoginPage.dart';
import 'package:login/screens/SplashScren/view/SplashPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CreateProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ],
      child:  Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => SplashPage(),
              'Intro' : (context) => IntroPage(),
              'login' : (context) => LoginPage(),
              'home' : (context) => HomePage(),
              'create' : (context) => CreatePage(),
            },
          );
        },
      ),
    )

  );
}