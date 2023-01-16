import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/utils/shared_prefference.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    IsLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  child: Lottie.asset("assets/animation/telegram.json"),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h,left: 1.5.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "From",
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 15.sp
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 11.5.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Jayraj",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 21.sp
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(color: Colors.blueAccent,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
