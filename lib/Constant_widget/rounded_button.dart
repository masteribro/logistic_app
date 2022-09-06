import 'package:flutter/material.dart';
import 'package:logistic_appp/Constant_widget/colors.dart';
import 'package:logistic_appp/page/Home_page.dart';

import '../Utils/router.dart';
import '../utils/firebase_service.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();

}

class _RoundedButtonState extends State<RoundedButton> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: ()async {
        dynamic result = await _auth.signInAnon();
        if (result != null) {
          print('signed in');
          Routers.push(context, Home());
        } else {
          print('error signing in');
        }},
        borderRadius:BorderRadius.circular(30),
        child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.kPrimaryColor,
        ),

        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
        widget.title,
        style: TextStyle(
        color: Colors.white,
        fontSize: 18
        )
        ,
        )
        ,
        ));
      }
    }

