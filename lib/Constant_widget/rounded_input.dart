import 'package:flutter/material.dart';
import 'package:logistic_appp/model/all_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Partials.dart';
import 'colors.dart';
import 'global_variables.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
   RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController controller;

//   @override
//   _RoundedInputState createState() => _RoundedInputState();
// }
//
// class _RoundedInputState extends StateMVC<RoundedInput>with ValidationMixin  {
AuthModel model = AuthModel();
  bool emailController = true;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          // validator: validateEmail,
          controller: controller,
          cursorColor: AppColors.kPrimaryColor,
          decoration: InputDecoration(
              icon: Icon(icon, color: AppColors.kPrimaryColor),
              hintText: hint,
              border: InputBorder.none
          ),
        ));
  }
}