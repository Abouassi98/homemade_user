import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemade_user/screens/signup_screen.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../providers/auth/confirmResetCodeProvider.dart';
import '../providers/auth/phoneVerificationProvider.dart';
import '../providers/auth/resendCode.dart';
import '../providers/changeData/changePhoneCodeProvider.dart';
import 'package:provider/provider.dart';


class ConfirmPhoneScreen extends StatefulWidget {
  final String phoneNumber;
  final int stateOfVerificationCode;
  ConfirmPhoneScreen({this.phoneNumber,this.stateOfVerificationCode,});
  @override
  _ConfirmPhoneScreenState createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends State<ConfirmPhoneScreen> {
  bool resend = false;
  int timer = 1;

  @override
  Widget build(BuildContext context) {
      var register =
        Provider.of<PhoneVerificationProvider>(context, listen: false);
    var confirmRessetCode =
        Provider.of<ConfirmResetCodeProvider>(context, listen: false);
    var changePhone =
        Provider.of<ChangePhoneCodeProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffFCE8E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              "تسجيل جديد",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "ادخل كود التفعيل المرسل اليك",
              style: TextStyle(color: Colors.black87, fontSize: 13),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
              child: Center(
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  backgroundColor:
                      Color(0x00000000), //Theme.of(context).accentColor,
                 
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    activeColor: Theme.of(context).primaryColor,
                    selectedColor: Theme.of(context).accentColor,
                    inactiveColor: Theme.of(context).accentColor,
                  ),
                  onChanged: (code) {
                    if (widget.stateOfVerificationCode == 1)
                      register.code = code;
                    else if (widget.stateOfVerificationCode == 2)
                      confirmRessetCode.code = code;
                    else {
                      changePhone.code = code;
                    }
                  },
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // textInputType: TextInputType.number,
                  autoFocus: true,
                  onCompleted: (String value) {
                    if (widget.stateOfVerificationCode == 1)
                      // register.phoneVerification(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SignupScreen()));
                    else if (widget.stateOfVerificationCode == 2)
                      confirmRessetCode.confirmResetCode(context);
                    else
                      changePhone.changePhoneCode(null, context);
                  },
                ),
              ),
            ),
            Visibility(
              visible: resend,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      child: new Text(
                        'إعادة ارسال الكود',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 13,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        // if (widget.stateOfVerificationCode == 1)
                        //   Provider.of<ResendCodeProvider>(context,
                        //           listen: false)
                        //       .phone = register.phone;
                        // else if (widget.stateOfVerificationCode ==
                        //     2)
                        //   Provider.of<ResendCodeProvider>(context,
                        //           listen: false)
                        //       .phone = confirmRessetCode.phone;
                        // else
                        //   Provider.of<ResendCodeProvider>(context,
                        //           listen: false)
                        //       .phone = changePhone.phone;

                        // Provider.of<ResendCodeProvider>(context,
                        //         listen: false)
                        //     .resendCode(context);
                        setState(() {
                          resend = false;
                        });
                        // resendCodeBloc.add(Click());
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'لم يصلك كود التفعيل؟',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            resend == true
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text("سيصل الكود خلال"),
                      SizedBox(height: 10),
                      Center(
                        child: SlideCountdownClock(
                          duration: Duration(minutes: timer),
                          slideDirection: SlideDirection.Down,
                          tightLabel: true,
                          onDone: () {
                            setState(() {
                              resend = true;
                            });
                          },
                          separator: ":",
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
