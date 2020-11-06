import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homemade_user/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var acceptRules = false;
  Widget buildTextFormField({
    String hintText,
    void Function(String value) onChanged,
    String Function(String value) validator,
  }) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffF3AB93),
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFCE8E6),
        appBar: AppBar(
          title: Text('تسجيل جديد'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                  buildTextFormField(
                    hintText: 'الاسم',
                  ),
                  buildTextFormField(
                    hintText: 'رقم الجوال',
                  ),
                  buildTextFormField(
                    hintText: 'البريد الإلكتروني',
                  ),
                  buildTextFormField(
                    hintText: 'كلمة المرور',
                  ),
                  buildTextFormField(
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
                            value: acceptRules,
                            onChanged: (value) {
                              setState(() {
                                acceptRules = value;
                              });
                            },
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
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
                                  print('شروط وأحكام');
                                },
                              text: 'الشروط والأحكام',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'HomeMade',
                                  color: Theme.of(context).primaryColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.1,
                  ),
                  Container(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
