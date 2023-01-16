import 'package:flutter/material.dart';
import 'package:login/screens/LoginScreen/provider/LoginProvider.dart';
import 'package:login/utils/shared_prefference.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginProvider? ProviderTrue;
  LoginProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<LoginProvider>(context,listen: true);
    ProviderFalse = Provider.of<LoginProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 65.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/image/home.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6.h,),
            SizedBox(
              width: 60.w,
              child: ElevatedButton(
                onPressed: () async {
                  ProviderTrue!.txtEmail.clear();
                  ProviderTrue!.txtPassword.clear();
                  Login(false);
                  var value = await ReadLogin();
                  print("====> $value");
                  Navigator.pushReplacementNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text("Sigh out"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
