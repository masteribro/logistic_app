import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistic_appp/Constant_widget/rounded_button.dart';
import 'package:logistic_appp/Constant_widget/rounded_input.dart';
import 'package:logistic_appp/Constant_widget/rounded_password_input.dart';
import 'package:logistic_appp/model/all_model.dart';


class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
AuthModel model = AuthModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedOpacity(
        opacity: isLogin ? 1.0 : 0.0,
        duration: animationDuration * 4,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    'Logistic',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),

                  const SizedBox(height: 40),

                  Image.asset('assets/logic.jpeg',
                    height: 200,
                    width: 500,
                  ),

                  const SizedBox(height: 40),

                  RoundedInput(icon: Icons.mail, hint: 'Username', controller: model.regLastNameController,),

                  RoundedPasswordInput(hint: 'Password', password: model.passwordController,),

                  const SizedBox(height: 10),

                  const RoundedButton(title: 'LOGIN'),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}