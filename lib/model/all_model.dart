import 'package:flutter/material.dart';
import 'package:logistic_appp/Constant_widget/global_variables.dart';


class AuthModel {
  //Sign in
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///sign up
  final TextEditingController regFirstNameController = TextEditingController();
  final TextEditingController regLastNameController = TextEditingController();
  final TextEditingController regPhoneNumberController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController(text: email);
  final TextEditingController regPasswordController = TextEditingController(text: password);
  final TextEditingController regConfirmPassController = TextEditingController();




  final GlobalKey<FormState> regFormKey = GlobalKey<FormState>();

  //insert phone
  final TextEditingController insertPhoneController = TextEditingController();
  final GlobalKey<FormState> insertPhoneFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  //otp
  final TextEditingController otpController = TextEditingController();

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
}

class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});
}
