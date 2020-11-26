import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:homemade_user/screens/order_following_screen.dart';
import 'package:homemade_user/screens/order_summary_screen.dart';
import 'package:homemade_user/screens/orders/ordersScreen.dart';
import '../config.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String payMethod = '';
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
        isSignup: true,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            // color: Theme.of(context).primaryColor,
          ),
          onPressed: () { Navigator.of(context).pop();},
        ),
        title: Text('تفاصيل الطلب'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Typicons.shopping_cart,
              size: 30,
              // color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => OrdersScreen(hideOptions: false,)));
            },
          ),
        ],
        elevation: 0,
      ),
      // backgroundColor: Color(0xffFCE8E6),
      body: Stack(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Config.buildContainer(
                    mediaQuery: mediaQuery,
                    height: 0.15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Text(
                            '4',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            'اسم المنتج',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'إضافات',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          trailing: Text(
                            '40 ريال',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     RaisedButton(
                        //       elevation: 8,
                        //       color: Theme.of(context).primaryColor,
                        //       onPressed: () {},
                        //       child: Text('تعديل'),
                        //       textColor: Colors.white,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: mediaQuery.width * 0.03,
                        //     ),
                        //     RaisedButton(
                        //       elevation: 8,
                        //       color: Color(0xffD66D50),
                        //       child: Text('حذف'),
                        //       onPressed: () {},
                        //       textColor: Colors.white,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: mediaQuery.width * 0.03,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Config.buildContainer(
                    mediaQuery: mediaQuery,
                    height: 0.135,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'عنوان التوصيل',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Text(
                            'المنزل: الشارع التاسع عشر- مبنى رقم ١',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Config.buildContainer(
                    mediaQuery: mediaQuery,
                    height: 0.26,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تفاصيل الدفع :',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'مجموع الطلب',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                '٤٠ ريال',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'رسوم التوصيل',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                '10 ريال',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'مجموع',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                '50 ريال',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.03,
                          ),
                          Text(
                            'ملاحظة: جميع الأسعار شاملة ضريبة القيمة المضافة ١٠٪',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Config.buildContainer(
                    mediaQuery: mediaQuery,
                    height: Platform.isIOS ? 0.49 : 0.42,
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'آلية الدفع',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.02,
                          ),
                          RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            value: 'رصيد المحفظة',
                            groupValue: payMethod,
                            onChanged: (value) {
                              setState(() {
                                payMethod = value;
                              });
                            },
                            title: Text(
                              'رصيد المحفظة',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            value: 'Visa / Master Card',
                            groupValue: payMethod,
                            onChanged: (value) {
                              setState(() {
                                payMethod = value;
                              });
                            },
                            title: Text(
                              'Visa / Master Card',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            value: ' Mada',
                            groupValue: payMethod,
                            onChanged: (value) {
                              setState(() {
                                payMethod = value;
                              });
                            },
                            title: Text(
                              ' Mada',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          if (Platform.isIOS)
                            RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              value: ' Apple Pay',
                              groupValue: payMethod,
                              onChanged: (value) {
                                setState(() {
                                  payMethod = value;
                                });
                              },
                              title: Text(
                                ' Apple Pay',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),

                          // Row(
                          //   children: [
                          //     Container(
                          //       color: Theme.of(context).primaryColor,
                          //       height: mediaQuery.height * 0.02,
                          //       width: mediaQuery.width * 0.03,
                          //     ),
                          //     SizedBox(
                          //       width: mediaQuery.width * 0.03,
                          //     ),
                          //     Text(
                          //       'Visa / Master Card/ Mada',
                          //       style: TextStyle(
                          //         color: Theme.of(context).primaryColor,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: mediaQuery.height * 0.01,
            left: mediaQuery.width * 0.02,
            right: mediaQuery.width * 0.02,
            child: Center(
              child: Container(
                width: mediaQuery.width * 0.4,
                child: RaisedButton(
                  elevation: 8,
                  color: Color(0xffF4AC94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'إتمام عملية الدفع',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: payMethod.isEmpty
                      ? null
                      : () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  OrderFollowingScreen(),
                            ),
                          );
                        },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
