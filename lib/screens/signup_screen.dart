import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homemade_user/config.dart';
import './home_screen.dart';
import './terms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  final String phoneNumber;
  SignupScreen({
    this.phoneNumber,
  });

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var acceptRules = false;
  var _formKey = GlobalKey<FormState>();
  var isInit = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Config.buildBottomNavigationBar(
          mediaQuery: mediaQuery,
          isSignup: true,
          context: context,
        ),
        backgroundColor: Color(0xffFCE8E6),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('تسجيل جديد'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'images/homemade_logo.PNG',
                          height: mediaQuery.height * 0.3,
                        ),
                      ),
                      Config.buildTextFormField(
                        hintText: 'الاسم',
                      ),
                      Config.buildTextFormField(
                        enabled: false,
                        initialValue: widget.phoneNumber,
                      ),
                      Config.buildTextFormField(
                        hintText: 'البريد الإلكتروني',
                      ),
                      Config.buildTextFormField(
                        secureText: true,
                        hintText: 'كلمة المرور',
                      ),
                      Config.buildTextFormField(
                        secureText: true,
                        hintText: 'تأكيد كلمة المرور',
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Container(
                        width: mediaQuery.width,
                        child: Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    Theme.of(context).primaryColor,
                              ),
                              child: Checkbox(
                                hoverColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                value: acceptRules,
                                onChanged: (value) {
                                  setState(() {
                                    acceptRules = value;
                                  });
                                },
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'أوافق على ',
                                    style: TextStyle(
                                        fontFamily: 'HomeMade',
                                        color: Theme.of(context).primaryColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                TermsApp(),
                                          ),
                                        );
                                      },
                                    text: 'الشروط والأحكام',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'HomeMade',
                                        color: Theme.of(context).primaryColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: mediaQuery.height * 0.01,
              left: mediaQuery.width * 0.2,
              right: mediaQuery.width * 0.2,
              child: Container(
                width: mediaQuery.width * 0.8,
                child: RaisedButton(
                  color: Color(0xffF3AB93),
                  child: Text('إنشاء حساب'),
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
            ),
          ],
        ),
      ),
    );
  }
}
