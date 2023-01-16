import 'package:flutter/material.dart';
import 'package:login/screens/LoginScreen/provider/LoginProvider.dart';
import 'package:login/utils/shared_prefference.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginProvider? ProviderTrue;
  LoginProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<LoginProvider>(context,listen: true);
    ProviderFalse = Provider.of<LoginProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: ProviderTrue!.key,
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/image/sighup.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8.h,
                        //color: Colors.red,
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: ProviderTrue!.txtEmail,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black
                            ),
                            suffixIcon: Icon(Icons.mail,color: Colors.blueAccent,)
                          ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "Please Enter Your E-mail";
                            }
                            else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Please Enter Valid Email";
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        height: 8.h,
                        //color: Colors.red,
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        child: TextFormField(
                          controller: ProviderTrue!.txtPassword,
                          obscureText: ProviderTrue!.hide,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                              ),
                              suffixIcon: InkWell(onTap: (){
                                ProviderTrue!.chnageicon(!ProviderTrue!.hide);
                              },child: Icon(ProviderTrue!.hide?Icons.visibility_off:Icons.visibility,color: Colors.blueAccent,))
                          ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "Please Enter Your Password";
                            }
                            else if (value!.length != 8) {
                              return "Please Enter Maximum 8 Character";
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 6.h),
                        child: InkWell(
                          onTap: () async {
                            data d1 = await read();
                            if(ProviderTrue!.key.currentState!.validate())
                              {
                                if((d1.email != ProviderTrue!.txtEmail.text) || (d1.pass != ProviderTrue!.txtPassword.text))
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong E-mail or password")));
                                }
                                else
                                {
                                  Login(true);
                                  var value = await ReadLogin();
                                  print("====> $value");
                                  Navigator.pushReplacementNamed(context, 'home');
                                }
                              }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter This Detail")));
                              }
                          },
                          child: Container(
                            height: 6.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent.shade700,
                                  Colors.blue.shade300,
                                ]
                              )
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Sigh in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Container(
                          height: 6.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          //color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create account",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 3.w,),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, 'create');
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
