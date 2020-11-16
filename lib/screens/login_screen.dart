import 'package:flutter/material.dart';
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
              ),
              Config.buildTextFormField(
                hintText: 'كلمة المرور',
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
