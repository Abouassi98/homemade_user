import 'package:flutter/material.dart';
import 'package:homemade_user/screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xffFCE8E6),
      body: Stack(
        children: [
          // top left circle
          Positioned(
            right: mediaQuery.size.width*-0.15,
            top: mediaQuery.size.height*-0.37,
            child: Container(
              height: mediaQuery.size.height * 0.8,
              width: mediaQuery.size.width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff366775),
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width*-0.06,
            top: mediaQuery.size.height*-0.18,
            child: Container(
              height: mediaQuery.size.height * 0.8,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffA2B4C0),
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.3,
            right: mediaQuery.size.width * 0.3,
            top: 150,
            child: Container(
              height: mediaQuery.size.height * 0.4,
              width: mediaQuery.size.width * 0.5,
              decoration: BoxDecoration(),
              child: Image.asset('images/homemade_logo.PNG'),
            ),
          ),

          // bottom circles
          Positioned(
            bottom: mediaQuery.size.height*-0.30,
            left: mediaQuery.size.width*-0.04,
            right: mediaQuery.size.width*-0.04,
            child: Container(
              height: mediaQuery.size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF4AC94),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuery.size.height*0.2,
                  ),
                  buildButton(
                    mediaQuery: mediaQuery,
                    textColor: Colors.white,
                    color: Color(0xff366775),
                    buttonTitle: 'دخول',
                    onPressed: (){
                       Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => SignupScreen(),
                          ),
                        );
                    }
                  ),
                  SizedBox(
                    height: mediaQuery.size.height*0.02,
                  ),
                  buildButton(
                    mediaQuery: mediaQuery,
                    color: Colors.white,
                    textColor: Color(0xff366775),
                    buttonTitle: 'تسجيل جديد',
                    onPressed: (){ Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => SignupScreen(),
                          ),
                        );}
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: mediaQuery.size.height*-0.07,
            left: mediaQuery.size.height*-0.03,
            child: Container(
              height: mediaQuery.size.height * 0.18,
              width: mediaQuery.size.width * 0.18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff366775),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildButton({
  @required MediaQueryData mediaQuery,
  @required Color color,
  @required Function onPressed,
  @required String buttonTitle,
  @required Color textColor,
}) {
  return Container(
    width: mediaQuery.size.width * 0.4,
    child: RaisedButton(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      color: color,
      child: Text(
        buttonTitle,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}
