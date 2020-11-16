import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/auth/forgetPasswordModel.dart';
import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
import '../../widgets/custom_progress_dialog.dart';
import '../../screens/confirm_phone_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'confirmResetCodeProvider.dart';

class ForgetPasswordProvider with ChangeNotifier {
  String phone;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  CustomProgressDialog customProgressDialog;
  ProgressDialog pr;

  ForgetPasswordModel model;
  forgetPassword(BuildContext context) async {
    customProgressDialog = CustomProgressDialog(context: context, pr: pr);
    customProgressDialog.showProgressDialog();
    customProgressDialog.showPr();
    Map<String, String> headers = {
      "X-localization": ''
    };
    FormData formData = FormData.fromMap({
      "phone_number": phone,
    });

    Response response =
        await _utils.post("forget-password", body: formData, headers: headers);
    if (response == null) {
      print('error forgetPassword');
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
      print("forget_password sucsseful");
      model = ForgetPasswordModel.fromJson(response.data);
    } else {
      print("error forget_password");
      model = ForgetPasswordModel.fromJson(response.data);
    }
    if (model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
      });
      Provider.of<ConfirmResetCodeProvider>(context, listen: false).phone =
          phone;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ConfirmPhoneScreen(
                stateOfVerificationCode: 2,
              )));
    } else {
      print('error forgetPassword');
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