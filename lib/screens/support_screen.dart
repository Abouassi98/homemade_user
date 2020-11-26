import 'package:flutter/material.dart';
import '../widgets/custom_alert.dart';
import '../widgets/details_text_field_no_img.dart';
import '../widgets/loader_btn.dart';
import '../widgets/register_text_field.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الدعم'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(8),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterTextField(
                label: 'الاسم',
                icon: Icons.person,
                type: TextInputType.text,
                onChange: (v) {},
                // errorText: state is PriceError ? 'السعر مطلوب' : null,
              ),
              SizedBox(height: 20),
              RegisterTextField(
                label: 'رقم الجوال',
                icon: Icons.call,
                type: TextInputType.text,
                onChange: (v) {},
                // errorText: state is PriceError ? 'السعر مطلوب' : null,
              ),
              SizedBox(height: 20),
              RegisterTextField(
                label: 'البريد الالكتروني',
                icon: Icons.email,
                type: TextInputType.number,
                onChange: (v) {},
                // errorText: state is PriceError ? 'السعر مطلوب' : null,
              ),
              SizedBox(height: 20),
              DetailsTextFieldNoImg(
                label: 'الموضوع',
                onChange: (v) {},
                // hint: 'مثال.. وقت التجهيز وطريقة التغليف',
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: LoaderButton(
                  load: false,
                  onTap: () {
                    CustomAlert().toast(
                        context: context,
                        title: 'تم الإرسال وسيتم المراجعة من قبل الإدارة');
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).primaryColor,
                  text: 'إرسال',
                  txtColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
