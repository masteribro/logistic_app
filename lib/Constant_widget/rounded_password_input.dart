import 'package:flutter/material.dart';
import 'package:logistic_appp/Constant_widget/colors.dart';
import 'package:logistic_appp/Constant_widget/global_variables.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Partials.dart';
import '../model/all_model.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatefulWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,
    required this.password,
  }) : super(key: key);

  final String hint;
  final TextEditingController password;

  @override
  _RoundedPasswordInputState createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends StateMVC<RoundedPasswordInput> with ValidationMixin {

  final AuthModel model = AuthModel();

  bool passController = true;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextFormField(
          validator: validatePassword,
          controller:widget.password,
          cursorColor: AppColors.kPrimaryColor,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock, color: AppColors.kPrimaryColor),
              hintText: widget.hint,
              border: InputBorder.none
          ),
        ));
  }
}