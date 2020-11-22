import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/home_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffFCE8E6),
       
        body: SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height*0.05,
              ),
              Center(

                child: Container(
                  height: mediaQuery.height * 0.4,
                  width: mediaQuery.width * 0.5,
                  decoration: BoxDecoration(),
                  child: Image.asset('images/homemade_logo.PNG'),
                ),
              ),
              Text(
                'إستعادة كلمة المرور',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
              Text(
                'من فضلك قم بإدخال كلمة المرور الجديدة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Config.buildTextFormField(
                  hintText: 'كلمة المرور',
                  secureText: true,
                  type: TextInputType.text,
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Config.buildTextFormField(
                  hintText: 'تأكيد كلمة المرور',
                  secureText: true,
                  type: TextInputType.text,
                ),
              ),
              SizedBox(height:mediaQuery.height * 0.02),
              Container(
                width: mediaQuery.width * 0.8,
                child: RaisedButton(
                  color: Color(0xffF3AB93),
                  child: Text('تحديث'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
