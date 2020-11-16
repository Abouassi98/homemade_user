import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/changeData/changePasswordModel.dart';

import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
import '../../widgets/custom_progress_dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ChangePasswordProvider with ChangeNotifier {
  String oldPassword;
  String password;
  String passwordConfirmation;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  CustomProgressDialog customProgressDialog;
  ProgressDialog pr;
  ChangePasswordModel _model;
  changePassword(String token, BuildContext context) async {
    customProgressDialog = CustomProgressDialog(context: context, pr: pr);
    customProgressDialog.showProgressDialog();
    customProgressDialog.showPr();
    Map<String, String> headers = {
      "X-localization": '',
      "Authorization": "Bearer $token"
    };
    FormData formData = FormData.fromMap({
      "current_password": oldPassword,
      "new_password": password,
      "password_confirmation": passwordConfirmation,
    });

    Response response =
        await _utils.post("change-password", body: formData, headers: headers);
    if (response == null) {
      print('error change_password');
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
      print("change_password sucsseful");
      _model = ChangePasswordModel.fromJson(response.data);
    } else {
      print("error change_password");
      _model = ChangePasswordModel.fromJson(response.data);
    }
    if (_model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        dialog.showSuccessDialog(
          btnOnPress: () {
            Navigator.pop(context);
          },
          context: context,
          msg: 'تم تغيير كلمة السر',
          btnMsg: 'موافق',
        );
      });
    } else {
      print('error change_password');
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
