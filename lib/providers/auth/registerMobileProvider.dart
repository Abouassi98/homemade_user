import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/auth/registerMobileModel.dart';

import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
import '../../widgets/custom_progress_dialog.dart';
import '../../screens/confirm_phone_screen.dart';
import '../../providers/auth/phoneVerificationProvider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class RegisterMobileProvider with ChangeNotifier {
  String phone;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  RegisterMobileModel model;
  CustomProgressDialog customProgressDialog;
  ProgressDialog pr;
  clear() {
    phone = null;
  }

  registerMobile(BuildContext context) async {
    customProgressDialog = CustomProgressDialog(context: context, pr: pr);
    customProgressDialog.showProgressDialog();
    customProgressDialog.showPr();
    Map<String, String> headers = {
      // "X-localization": localization.currentLanguage.toString()
    };
    FormData formData = FormData.fromMap({
      "phone_number": phone,
    });

    Response response =
        await _utils.post("register-mobile", body: formData, headers: headers);
    if (response == null) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        print('error register mobile res == null');
        dialog.showWarningDialog(
          btnOnPress: () {},
          context: context,
          msg: 'برجى تفقد الاتصال بالانترنت',
        );
      });
      return;
    }
    if (response.statusCode == 200) {
      print("register_mobile sucsseful");
      model = RegisterMobileModel.fromJson(response.data);
    } else {
      print("error register_mobile");
      model = RegisterMobileModel.fromJson(response.data);
    }
    if (model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
      });
      Provider.of<PhoneVerificationProvider>(context, listen: false).phone =
          phone;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ConfirmPhoneScreen(
                //  phoneNumber: phone,
                stateOfVerificationCode: 1,
              )));
      clear();
    } else {
      print('error register_mobile');
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        dialog.showErrorDialog(
          btnOnPress: () {},
          context: context,
          msg: model.error[0].value,
          ok: 'موافق',
        );
      });
    }
    notifyListeners();
  }
}
