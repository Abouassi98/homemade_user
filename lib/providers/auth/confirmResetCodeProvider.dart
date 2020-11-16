import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/auth/confirmResetCodeModel.dart';

import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
import '../../widgets/custom_progress_dialog.dart';
// import 'package:homemade/src/UI/Registeration/reset_password_screen.dart';
import './resetPasswordProvider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class ConfirmResetCodeProvider with ChangeNotifier {
  String phone;
  String code;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  CustomProgressDialog customProgressDialog;
  ProgressDialog pr;

  ConfirmResetCodeModel _model;
  confirmResetCode(BuildContext context) async {
    customProgressDialog = CustomProgressDialog(context: context, pr: pr);
    customProgressDialog.showProgressDialog();
    customProgressDialog.showPr();
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "phone_number": phone,
      "code": code,
    });

    Response response = await _utils.post("confirm-reset-code",
        body: formData, headers: headers);
    if (response == null) {
      print('error confirm_reset_code');
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        dialog.showWarningDialog(
          btnOnPress: () {},
          context: context,
          msg: 'يرجى تفقد الاتصال بالانترنت',
        );
      });

      return;
    }
    if (response.statusCode == 200) {
      print("confirm_reset_code sucsseful");
      _model = ConfirmResetCodeModel.fromJson(response.data);
    } else {
      print("error confirm_reset_code");
      _model = ConfirmResetCodeModel.fromJson(response.data);
    }
    if (_model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
      });
      Provider.of<ResetPasswordProvider>(context, listen: false).phone = phone;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          // builder: (context) => ResetPasswordScreen(
          //     // countryCode: countryCode,
          //     // phone: phone,
          //     ),   
                         ));
    } else {
      print('error confirm_reset_code');
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        dialog.showErrorDialog(
          btnOnPress: () {},
          context: context,
          msg: _model.error[0].value,
          ok: 'موافق',
        );
      });
    }
    notifyListeners();
  }
}
