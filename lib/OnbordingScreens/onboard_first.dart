import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logistic_appp/OnbordingScreens/second_onbording_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Constant_widget/colors.dart';
import '../utils/router.dart';



class OnboardFirst extends StatefulWidget {
  const OnboardFirst({Key? key}) : super(key: key);

  @override
  State<OnboardFirst> createState() => _OnboardFirstState();
}

class _OnboardFirstState extends State<OnboardFirst> {

  @override
  void initState() {
   super.initState();
   navigateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.kPrimaryColor,
      body: Column(
        children: [SizedBox(height: 15.h),
          Center(
            child: Image.asset(
              "assets/logistic_map.jpeg",
              height: 30.h,
              width: 80.w,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
           Text(
            "The line between disorder and order",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp, fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "lies in logistics…",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                decoration: TextDecoration.none),
          ),

          SizedBox(
            height: 30.h,
          ),
             Padding(
               padding: const EdgeInsets.only(left: 30, right: 30),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 0, width: 0,),
                  Row(children:  [
                     const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 5,
                    ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 5,
                  ),
                    ]
                 ),
                  InkWell(onTap: () {Routers.pushNamed(context, '/second_onboarding');},
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
    Timer( Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => SecondOnboarding()
    )) );

  }
}
