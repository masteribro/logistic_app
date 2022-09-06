import 'package:flutter/material.dart';
import 'package:logistic_appp/Constant_widget/colors.dart';
import 'package:logistic_appp/Partials.dart';
import 'package:logistic_appp/page/Home_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Utils/router.dart';
import '../model/all_model.dart';
import '../utils/firebase_service.dart';
import 'global_variables.dart';

class RoundedButtonRegistration extends StatefulWidget {
  const RoundedButtonRegistration({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function() onTap;


  @override
  _RoundedButtonRegistrationState createState() => _RoundedButtonRegistrationState();

}

class _RoundedButtonRegistrationState extends StateMVC<RoundedButtonRegistration> with ValidationMixin{
  final AuthService _auth = AuthService();
  String error = '';
  final AuthModel model = AuthModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: widget.onTap,
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

