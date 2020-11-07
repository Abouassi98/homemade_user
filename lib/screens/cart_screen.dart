import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Widget buildContainer({
    Size mediaQuery,
    Widget child,
    double height,
  }) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2.0,
              color: Color(0xffFCE8E6),
            ),
            bottom: BorderSide(
              width: 2.0,
              color: Color(0xffFCE8E6),
            ),
          ),
        ),
        width: mediaQuery.width,
        height: mediaQuery.height * height,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
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
              buildContainer(
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
              buildContainer(
                mediaQuery: mediaQuery,
                height: 0.2,
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
                        height: mediaQuery.height*0.01,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
