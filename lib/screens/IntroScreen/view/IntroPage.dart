import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login/utils/shared_prefference.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Telegram",
              image: Container(
                  height: 22.h,
                  width: 22.h,
                  child: Lottie.asset("assets/animation/fi.json"),
              ),
              bodyWidget: Column(
                children: [
                  Text("The worls's fastest messaging app.",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  Text("it is free and secure.",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                ],
              )
            ),
            PageViewModel(
              title: "Fast",
              image: Container(
                height: 23.h,
                width: 23.h,
                alignment: Alignment.centerLeft,
                child: Lottie.asset("assets/animation/speed.json"),
              ),
                bodyWidget: Column(
                  children: [
                    Text("Telegram delivers messages",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("faster than any other aplication",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                )            ),
            PageViewModel(
              title: "Free",
              image: Container(
                height: 21.h,
                width: 21.h,
                child: Lottie.asset("assets/animation/gift.json"),
              ),
                bodyWidget: Column(
                  children: [
                    Text("Telegram provides free ultimited",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("cloud storage for chats and media.",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                )            ),
            PageViewModel(
              title: "Powerful",
              image: Container(
                height: 25.h,
                width: 25.h,
                child: Lottie.asset("assets/animation/power.json"),
              ),
                bodyWidget: Column(
                  children: [
                    Text("Telegram has no limits on",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("the size of your media and chats.",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                )            ),
            PageViewModel(
              title: "Secure",
              image: Container(
                height: 25.h,
                width: 25.h,
                child: Lottie.asset("assets/animation/secure.json"),
              ),
                bodyWidget: Column(
                  children: [
                    Text("Telegram keeps your messages safe",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                    Text("from hackers attacks",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                  ],
                )            ),
          ],
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          onDone: (){
            Intro(true);
            Navigator.pushReplacementNamed(context, 'login');
          },
          done: Text("Done"),
          skip: Text("Skip"),
          next: Text("Next"),
        ),
      ),
    );
  }
}
