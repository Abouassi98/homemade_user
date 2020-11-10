import 'package:flutter/material.dart';
import 'package:homemade_user/screens/order_summary_screen.dart';
import '../config.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            // color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
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
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      // backgroundColor: Color(0xffFCE8E6),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Config.buildContainer(
                mediaQuery: mediaQuery,
                height: 0.2,
                child: Column(
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      trailing: Text(
                        '40 ريال',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          elevation: 8,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          child: Text('تعديل'),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.03,
                        ),
                        RaisedButton(
                          elevation: 8,
                          color: Color(0xffD66D50),
                          child: Text('حذف'),
                          onPressed: () {},
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Config.buildContainer(
                mediaQuery: mediaQuery,
                height: 0.12,
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
                height: 0.25,
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
                height: 0.22,
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
                      Row(
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            height: mediaQuery.height * 0.02,
                            width: mediaQuery.width * 0.03,
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.03,
                          ),
                          Text(
                            'Apple Pay',
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
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            height: mediaQuery.height * 0.02,
                            width: mediaQuery.width * 0.03,
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.03,
                          ),
                          Text(
                            'Visa / Master Card/ Mada',
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
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            height: mediaQuery.height * 0.02,
                            width: mediaQuery.width * 0.03,
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.03,
                          ),
                          Text(
                            'رصيد المحفظة',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.2,
              ),
              Center(
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
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => OrderSummaryScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
