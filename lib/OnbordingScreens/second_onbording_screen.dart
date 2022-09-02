import 'dart:async';


import 'package:flutter/material.dart';
import 'package:logistic_appp/OnbordingScreens/third_onboarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../Utils/router.dart';
import '../Constant_widget/colors.dart';

class SecondOnboarding extends StatefulWidget {
  const SecondOnboarding({Key? key}) : super(key: key);

  @override
  State<SecondOnboarding> createState() => _SecondOnboardingState();
}

class _SecondOnboardingState extends State<SecondOnboarding> {

  @override
  void initState() {
   super.initState();
   navigateToNextPage();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kPrimaryColor,
      body: Column(
        children: [SizedBox(height: 15.h,),
          Center(
            child: Image.asset(
              "assets/National-Logistics-Day.jpeg",
              height: 200,
              width: 500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text(
            "Quality is not an act, it is a habit",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16, fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 33.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 0, width: 0,),
                Row(children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 5,
                  ),

                ]
                ),
                InkWell(onTap: () {Routers.pushNamed(context, '/third_onboarding');},
                  child: Container(height: 3.h, width: 11.w,
                    decoration: BoxDecoration(color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none, fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNextPage() async {
    Timer( const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const ThirdOnboardingScreen()
    )) );

  }
}
