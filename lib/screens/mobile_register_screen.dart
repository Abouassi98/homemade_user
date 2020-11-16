import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/confirm_phone_screen.dart';

class MobileRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffFCE8E6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                height: mediaQuery.height * 0.4,
                width: mediaQuery.width * 0.5,
                decoration: BoxDecoration(),
                child: Image.asset('images/homemade_logo.PNG'),
              ),
            ),
            Text(
              'تسجيل جديد',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
            Text(
              'من فضلك قم بإدخال رقم جوالك ليصلك كود التفعيل',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Config.buildTextFormField(hintText: 'رقم الجوال',type: TextInputType.phone),
            ),
            Container(
              width: mediaQuery.width * 0.8,
              child: RaisedButton(
                color: Color(0xffF3AB93),
                child: Text('التالي'),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {
                  print('sssssss');
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => ConfirmPhoneScreen(),
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
    );
  }
}
