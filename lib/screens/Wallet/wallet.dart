import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'widget/chargeScreen.dart';
import 'widget/history_card.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  void initState() {
    super.initState();
  }

  String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "محفظتي",
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "2000",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "الرصيد",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return HistoryCard();
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (c) => ChargeScreen())),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "اشحن محفظتك",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.credit_card,
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // BlocListener<BalanceBloc, AppState>(
      //   bloc: balanceBloc,
      //   listener: (_, state) {
      //     if (state is RequestSent) {
      //       CustomAlert().toast(
      //           context: context,
      //           title: 'تم إرسال طلبك إلي الإدارة وسيتم التواصل معك');
      //     } else if (state is RequestError) {
      //       CustomAlert().toast(
      //           context: context,
      //           title: '  رصيدك اقل من الحد الآدني للسحب    ');
      //     }
      //   },
      //   child: BlocBuilder<BalanceBloc, AppState>(
      //     bloc: balanceBloc,
      //     builder: (_, state) {
      //       if (state is Done) {
      //         BalanceModel _res = state.model;
      //         return
      //       }
      //       return AppLoader();
      //     },
      //   ),
      // ),
    );
  }
}
