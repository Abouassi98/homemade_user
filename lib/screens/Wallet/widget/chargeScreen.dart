import 'package:flutter/material.dart';
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
                    DropdownButton(
                      hint: Text(
                        initialValue,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Visa / MasterCard',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Mada',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Apple Pay',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          value: 11,
                        ),
                      ],
                      onChanged: (value) {
                        if (value == 2) {
                          setState(() {
                            initialValue = 'Visa / MasterCard';
                          });
                        } else if (value == 6) {
                          setState(() {
                            initialValue = 'Mada';
                          });
                        } else if (value == 11) {
                          setState(() {
                            initialValue = 'Apple Pay';
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    RegisterTextField(
                      error: (value) {
                        if (value.isEmpty) {
                          return "قيمة الشحن مطلوب";
                        }
                        if (payMethod <= 0) {
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
