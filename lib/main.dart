import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistic_appp/Constant_widget/colors.dart';
import 'package:logistic_appp/model/user.dart';
import 'package:logistic_appp/utils/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'OnbordingScreens/onboard_first.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return StreamProvider<UserModel?>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
              title: 'Logistic',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: AppColors.kPrimaryColor,
                  textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
              home: const OnboardFirst(),
            ),
          );});
  }
}


