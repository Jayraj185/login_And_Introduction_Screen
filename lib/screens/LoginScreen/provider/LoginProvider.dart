import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier
{
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool hide=true;
  void chnageicon(value)
  {
    hide=value;
    notifyListeners();
  }
}