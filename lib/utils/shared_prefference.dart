import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//modal calss
class data
{
  String? email,pass;

  data({this.email, this.pass});
}

//user sigh up data
void sighup(String email,String password) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('e1', email);
  pref.setString('p1', password);
}

//user login data and sigh up data check karva
Future<data> read() async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  data d1 = data(email: pref.getString("e1"),pass: pref.getString("p1"),);
  return d1;
}

//jyare user login kare to home page nakar login page
void IsLogin(BuildContext context)
async {
  var isLogin = await ReadLogin();
  var isIntro = await ReadIntro();
  print("====> $isLogin");
  Timer(Duration(milliseconds: 1400), () {
    if(isLogin!=null)
    {

      if(isIntro==true)
        {
          if(isLogin)
          {
            Navigator.pushReplacementNamed(context, 'home');
          }
          else
          {
            Navigator.pushReplacementNamed(context, 'login');
          }
        }
      else
        {
          Navigator.pushReplacementNamed(context, 'Intro');
        }
    }
    else
    {
      if(isIntro==true)
        {
          Navigator.pushReplacementNamed(context, 'login');
        }
      else
        {
          Navigator.pushReplacementNamed(context, 'Intro');
        }

    }

  });
}

//if user login or sigh up to true or false value
void Login(bool value)
async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('ch', value);
}

//get data if user login check user login bool value or sigh up bool value
Future<bool?> ReadLogin()
async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var readLogin = pref.getBool('ch');
  return readLogin;
}

// user intro na done button par click karshe tyre true value thashe
void Intro(bool value)
async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('ch', value);
}

//get data if user login check user login bool value or sigh up bool value
Future<bool?> ReadIntro()
async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var readIntro = pref.getBool('ch');
  return readIntro;
}
