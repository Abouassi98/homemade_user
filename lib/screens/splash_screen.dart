import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import './signup_or_login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SplashScreenView(
        home: SignupOrLoginScreen(),
        duration: 7000,
        imageSize: 200,
        imageSrc: "images/homemadelogo.png",
        text: "مرحبا بكم في تطبيق هوم ميد",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 20.0,
        ),
        colors: [
          Color(0xffFCE8E6),
          Color(0xff366775),
          Color(0xffF3AB93),
          Colors.white,
        ],
         backgroundColor: Color(0xffFCE8E6),
        // backgroundColor: Color(0xffFCE8E6),
      ),
    );
  }
}
