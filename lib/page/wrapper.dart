import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import 'Home_page.dart';
import 'login_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    print(user);
    if (user == null){
      return LoginPage();
    } else {
      return Home();
    }

  }
}