import 'package:flutter/material.dart';
import 'package:homemade_user/screens/order_details_screen.dart';
import '../widgets/order_item.dart';
import '../models/order.dart';
import '../config.dart';

class OrderCountScreen extends StatefulWidget {
  @override
  _OrderCountScreenState createState() => _OrderCountScreenState();
}

class _OrderCountScreenState extends State<OrderCountScreen> {
  List<Order> myOrders = [
    Order(
      orderType: OrderTab.Applicable,
      title: 'وجبة شاورما ميكس',
      status: 'جديد',
      price: 25,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      orderType: OrderTab.Applicable,
      title: 'بيتزا',
      status: 'نشط',
      price: 85,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      orderType: OrderTab.Applicable,
      title: 'كنافة نابلسي',
      status: 'نشط',
      price: 75,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      orderType: OrderTab.Scheduled,
      title: 'كب كيك',
      status: 'جديد',
      price: 65,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      orderType: OrderTab.Scheduled,
      title: 'لحمة',
      status: 'جديد',
      price: 25,
      date: DateTime.now(),
      imageUrl: '',
    ),
  ];
  var tab = OrderTab.Applicable;
  @override
  Widget build(BuildContext context) {
    List<Order> editedOrder =
        myOrders.where((element) => element.orderType == tab).toList();
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
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'عدد الطلبات',
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      tab = OrderTab.Applicable;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: tab == OrderTab.Applicable
                          ? Colors.white
                          : Color(0xffF3AB93),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Color(0xffFCE8E6),
                      ),
                    ),
                    height: mediaQuery.height * 0.05,
                    width: mediaQuery.width * 0.28,
                    child: Center(
                        child: Text(
                      'الطلبات الحالية',
                      style: TextStyle(
                        color: tab == OrderTab.Applicable
                            ? Colors.black
                            : Colors.white,
                        fontSize: 12,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width * 0.01,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      tab = OrderTab.Scheduled;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: tab == OrderTab.Scheduled
                          ? Colors.white
                          : Color(0xffF3AB93),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Color(0xffFCE8E6),
                      ),
                    ),
                    height: mediaQuery.height * 0.05,
                    width: mediaQuery.width * 0.28,
                    child: Center(
                        child: Text(
                      'الطلبات المجدولة',
                      style: TextStyle(
                        color: tab == OrderTab.Scheduled
                            ? Colors.black
                            : Colors.white,
                        fontSize: 12,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffFCE8E6),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      children: editedOrder
                          .map(
                            (order) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        OrderDetailsScreen(),
                                  ),
                                );
                              },
                              child: OrderItem(
                                title: order.title,
                                imageUrl: order.imageUrl,
                                date: order.date,
                                price: order.price,
                                status: order.status,
                              ),
                            ),
                          )
                          .toList()),
                )),
          ],
        ),
      ),
    );
  }
}
