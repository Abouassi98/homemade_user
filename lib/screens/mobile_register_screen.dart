import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
// import 'package:homemade_user/providers/auth/phoneVerificationProvider.dart';
import 'package:homemade_user/screens/confirm_phone_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileRegisterScreen extends StatefulWidget {
  final String title;
  MobileRegisterScreen({
    this.title = 'تسجيل جديد',
  });

  @override
  _MobileRegisterScreenState createState() => _MobileRegisterScreenState();
}

class _MobileRegisterScreenState extends State<MobileRegisterScreen> {
  var controller = TextEditingController();
  var phoneNumber = '';

  var isRegister = false;
  var key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffFCE8E6),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height*0.09,
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
                widget.title,
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
                child: Config.buildTextFormField(
                    key: key,
                    hintText: 'رقم الجوال',
                    validator: (value) =>
                        value.isEmpty ? 'يرجى إدخال رقم الجوال' : null,
                    onChanged: (value)=>phoneNumber=value,
                    type: TextInputType.number),
              ),
              Container(
                width: mediaQuery.width * 0.8,
                child: RaisedButton(
                  color: Color(0xffF3AB93),
                  child: Text('التالي'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed:  () async {
                          var isValid = key.currentState.isValid;
                          if (!isValid) {
                            print('ff');
                            return;
                          }
                          if (widget.title == 'تسجيل جديد') {
                            setState(() {
                              isRegister = true;
                            });
                            var prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            await prefs.setString('register-phone-number',
                               phoneNumber.trim());
                            setState(() {
                              isRegister = false;
                            });
                          }
                          print('sssssss');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ConfirmPhoneScreen(
                                stateOfVerificationCode:
                                    widget.title == 'تسجيل جديد' ? 1 : 2,
                              ),
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
