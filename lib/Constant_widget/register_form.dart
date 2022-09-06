import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistic_appp/Constant_widget/rounded_button.dart';
import 'package:logistic_appp/Constant_widget/rounded_button_registration.dart';
import 'package:logistic_appp/Constant_widget/rounded_input.dart';
import 'package:logistic_appp/Constant_widget/rounded_password_input.dart';
import 'package:logistic_appp/model/all_model.dart';

import '../utils/firebase_service.dart';
import 'global_variables.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  AuthModel model = AuthModel();
  final AuthService _auth = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Form(
                key:  model.regFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(height: 10),

                    const Text(
                      'Welcome',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),

                    const SizedBox(height: 40),

                    Image.asset('assets/logistics_reg.jpeg',
                      height: 200,
                      width: 500,
                    ),

                    const SizedBox(height: 40),

                    RoundedInput(icon: Icons.mail, hint: 'Email', controller: model.regEmailController,),

                    RoundedInput(icon: Icons.face_rounded, hint: 'Name', controller: model.regLastNameController,),
                    RoundedPasswordInput(hint: 'Password', password: model.regPasswordController,),

                    const SizedBox(height: 10),

                    RoundedButtonRegistration(title: 'SIGN UP',onTap: ()async{
                      if(model.regFormKey.currentState!.validate()){
                        // String password,email;
                        password = model.regPasswordController.text.trim();
                        email = model.regEmailController.text.trim();
                        dynamic result = await _auth.registerWithEmailAndPassword(email!, password!);
                        if(result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }

                         },),
                    //
                    // InkWell(
                    //   onTap: ()=>print('model ${model.regPasswordController.text} ${model.regEmailController.text}'),
                    //     child: const Text('print', style: TextStyle(fontSize: 30,color:Colors.black,fontWeight: FontWeight.w700),)),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}