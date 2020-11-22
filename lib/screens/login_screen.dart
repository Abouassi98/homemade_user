import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homemade_user/screens/mobile_register_screen.dart';
import './home_screen.dart';
import '../config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: Config.buildBottomNavigationBar(
          mediaQuery: mediaQuery,
          isSignup: true,
          context: context,
        ),
        backgroundColor: Color(0xffFCE8E6),
        appBar: AppBar(
          title: Text('دخول'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'images/homemade_logo.PNG',
                  height: mediaQuery.height * 0.3,
                ),
              ),
              Config.buildTextFormField(
                hintText: 'رقم الجوال',
                type: TextInputType.number
              ),
              Config.buildTextFormField(
                secureText: true,
                hintText: 'كلمة المرور',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child:RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'هل نسيت كلمة المرور؟ ',
                              style: TextStyle(
                                  fontFamily: 'HomeMade',
                                  color: Theme.of(context).primaryColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => MobileRegisterScreen(title: 'إستعادة كلمة المرور',),
                                    ),
                                  );
                                },
                              text: 'إضغط هنا',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'HomeMade',
                                  color: Theme.of(context).primaryColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ]),
                        ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.12,
              ),
              Container(
                width: mediaQuery.width * 0.8,
                child: RaisedButton(
                  color: Color(0xffF3AB93),
                  child: Text('دخول'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    print('sssssss');
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeScreen(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
