import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/order_summary_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderFollowingScreen extends StatefulWidget {
  @override
  _OrderFollowingScreenState createState() => _OrderFollowingScreenState();
}

class _OrderFollowingScreenState extends State<OrderFollowingScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
      ),
      appBar: AppBar(
        title: Text('متابعة الطلب'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'images/homemade_logo.PNG',
                            fit: BoxFit.cover,
                            height: mediaQuery.height * 0.18,
                            width: mediaQuery.width * 0.3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Text(
                        'إسم المتجر',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff366775),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Text(
                        'رقم الطلب : ١٢٣٤٥٦٧',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff366775),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Config.buildContainer(
                mediaQuery: mediaQuery,
                height: 0.125,
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
                height: 0.12,
                child: ListTile(
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
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Config.buildContainer(
                mediaQuery: mediaQuery,
                height: 0.12,
                child: ListTile(
                  title: Text(
                    'رقم السائق',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '+5215487653',
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Acme',
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () async {
                      final callDriver = 'tel:+5215487653';
                      await launch(callDriver.toString());
                    },
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
                height: 0.145,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'حالة الطلب: مجدول',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'تاريخ التوصيل: الاثنين 10/8/2020',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'الوقت: 10:30 مساءا',
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
                      'إتمام الطلب',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
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
                height: mediaQuery.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
