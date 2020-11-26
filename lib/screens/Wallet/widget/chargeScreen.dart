import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../config.dart';
import 'dart:io' show Platform;
import '../../../widgets/loader_btn.dart';
import '../../../widgets/register_text_field.dart';

import '../bankPayment.dart';

import '../online_payment.dart';

class ChargeScreen extends StatefulWidget {
  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {
  String price;
  final _form = GlobalKey<FormState>();
  bool autoError = false;
  int payMethod = 0;
  String initialValue = 'اختر طرق الدفع';
  List<DropdownMenuItem> get items {
    List<dynamic> payMethod = [
      {
        'method': 'Visa / MasterCard',
        'value': 2,
      },
      {
        'method': 'Mada',
        'value': 6,
      },
      {
        'method': 'Apple Pay',
        'value': 11,
      },
    ];
    List<DropdownMenuItem> myItems = [];
    for (var i = 0; i < payMethod.length; i++) {
      if (Platform.isAndroid && payMethod[i]['value'] != 11) {
        myItems.add(
          DropdownMenuItem(
            child: Text(
              payMethod[i]['method'],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
            value: payMethod[i]['value'],
          ),
        );
      } else if (Platform.isIOS) {
        myItems.add(
          DropdownMenuItem(
            child: Text(
              payMethod[i]['method'],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
            value: payMethod[i]['value'],
          ),
        );
      }
    }
    return myItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "شحن المحفظة",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _form,
              autovalidate: autoError,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    DropdownButton(
                      hint: Text(
                        initialValue,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                        ),
                      ),
                      items: items,
                      onChanged: (value) {
                        if (value == 2) {
                          setState(() {
                            initialValue = 'Visa / MasterCard';
                          });
                        } else if (value == 6) {
                          setState(() {
                            initialValue = 'Mada';
                          });
                        } else if (value == 11 && Platform.isIOS) {
                          setState(() {
                            initialValue = 'Apple Pay';
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RegisterTextField(
                      error: (value) {
                        if (value.isEmpty) {
                          return "قيمة الشحن مطلوب";
                        }
                        if (initialValue == 'اختر طرق الدفع') {
                          return 'برجاء إختيار طريقة الشحن';
                        }

                        return null;
                      },
                      onChange: (v) {
                        // paymentBloc.updateCash(int.parse(v));
                        // price = v;
                      },
                      label: 'قيمة الشحن',
                      icon: Icons.attach_money,
                      type: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    LoaderButton(
                      load: false,
                      text: 'شحن الآن',
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        setState(() {
                          autoError = true;
                        });
                        final isValid = _form.currentState.validate();
                        if (!isValid) {
                          return;
                        }
                        _form.currentState.save();
                        // Fluttertoast.showToast(msg: 'تم الشحن');
                        Navigator.of(context).pop();
                        // paymentBloc.add(Click());
                      },
                      txtColor: Colors.white,
                    ),
                  ],
                ),
              )
              //  BlocListener<PaymentBloc, AppState>(
              //   bloc: paymentBloc,
              //   listener: (_, state) {
              //     if (state is Error) {
              //       CustomAlert().toast(context: context, title: state.msg);
              //     } else if (state is Done) {
              //       PaymentModel _res = state.model;
              //       Navigator.pop(context);
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (_) => OnlinePaymentScreen(
              //                   url: _res.data[0].paymentUrl)));
              //     }
              //   },
              //   child: BlocBuilder<PaymentBloc, AppState>(
              //     bloc: paymentBloc,
              //     builder: (_, state) {
              //       return
              //     },
              //   ),
              // )
              ),
        ));
  }
}
