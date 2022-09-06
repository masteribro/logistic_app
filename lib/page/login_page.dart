import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_appp/Constant_widget/colors.dart';
import 'package:logistic_appp/model/user.dart';
import 'package:provider/provider.dart';

import '../Constant_widget/cancel_button.dart';
import '../Constant_widget/login_form.dart';
import '../Constant_widget/register_form.dart';
import 'Home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  bool isLogin = true;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> login_key = GlobalKey<FormState>();
  final GlobalKey<FormState> reg_key = GlobalKey<FormState>();
  bool key = true;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize).animate(CurvedAnimation(parent: animationController!, curve: Curves.linear));

    return Scaffold(
      body: Form(
        key: key? login_key: reg_key,
        child: Stack(
          children: [
            Positioned(
                top: 100,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.kPrimaryColor
                  ),
                )
            ),

            Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.kPrimaryColor
                  ),
                )
            ),

            // Cancel Button
            CancelButton(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              animationController: animationController,
              tapEvent: isLogin ? null : () {
                animationController!.reverse();
                setState(() {
                  isLogin = !isLogin;
                });
              },
            ),

            // Login Form
            LoginForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultLoginSize),

            // Register Container
            AnimatedBuilder(
              animation: animationController!,
              builder: (context, child) {
                if (viewInset == 0 && isLogin) {
                  return buildRegisterContainer();
                } else if (!isLogin) {
                  return buildRegisterContainer();
                }

                // Returning empty container to hide the widget
                return Container();
              },
            ),

            // Register Form
            RegisterForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultRegisterSize),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: AppColors.kBackgroundColor
        ),

        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin ? null : () {
            animationController!.forward();

            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin ? Text(
            "Don't have an account? Sign up",
            style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 18
            ),
          ) : null,
        ),
      ),
    );
  }
}
