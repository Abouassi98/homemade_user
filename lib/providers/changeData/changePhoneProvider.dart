import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/changeData/changePasswordModel.dart';
import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
import '../../widgets/custom_progress_dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import 'changePhoneCodeProvider.dart';

class ChangeMobileProvider with ChangeNotifier {
  String phone;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  ChangePasswordModel model;
  CustomProgressDialog customProgressDialog;
  ProgressDialog pr;
  changeMobile(String token, BuildContext context) async {
    customProgressDialog = CustomProgressDialog(context: context, pr: pr);
    customProgressDialog.showProgressDialog();
    customProgressDialog.showPr();
    Map<String, String> headers = {
      "X-localization": '',
      "Authorization": "Bearer $token"
    };
    FormData formData = FormData.fromMap({
      "phone_number": phone,
    });

    Response response =
        await _utils.post("change-phone", body: formData, headers: headers);
    if (response == null) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
        print('error change mobile res == null');
        dialog.showWarningDialog(
          btnOnPress: () {},
          context: context,
          msg: 'يرجى تفقد الاتصال بالانترنت',
        );
      });
      return;
    }
    if (response.statusCode == 200) {
      print("change_mobile sucsseful");
      model = ChangePasswordModel.fromJson(response.data);
    } else {
      print("error change_mobile");
      model = ChangePasswordModel.fromJson(response.data);
    }
    if (model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
        customProgressDialog.hidePr();
      });
      Provider.of<ChangePhoneCodeProvider>(context, listen: false).phone =
          phone;
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => ConfirmCode(
      //           phoneNumber: phone,
      //           stateOfVerificationCode: 3,
      //         )));
    } else {
      print('error change_mobile');
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
