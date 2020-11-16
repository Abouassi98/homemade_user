import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/auth/registerMobileModel.dart';
import '../../helper/networkUtlis.dart';
import '../../widgets/custom_new_dialog.dart';
class ResendCodeProvider with ChangeNotifier {
  String phone;

  NetworkUtil _utils = new NetworkUtil();
  CustomDialog dialog = CustomDialog();
  RegisterMobileModel model;

  resendCode(BuildContext context) async {

    Map<String, String> headers = {
      "X-localization": ''
    };
    FormData formData = FormData.fromMap({
      "phone_number": phone,
    });

    Response response =
        await _utils.post("resend-code", body: formData, headers: headers);
   
    if (response.statusCode == 200) {
      print("resend-code sucsseful");
      model = RegisterMobileModel.fromJson(response.data);
    } else {
      print("error resend-code");
      model = RegisterMobileModel.fromJson(response.data);
    }
    if (model.code == 200) {
      Future.delayed(Duration(seconds: 1), () {
      });

    } else {
      print('error resend-code');

    }
    notifyListeners();
  }
}
