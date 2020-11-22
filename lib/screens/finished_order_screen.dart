import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/widgets/order_item.dart';
import '../models/order.dart';

class FinishedOrderScreen extends StatefulWidget {
  @override
  _FinishedOrderScreenState createState() => _FinishedOrderScreenState();
}

class _FinishedOrderScreenState extends State<FinishedOrderScreen> {
  List<Order> myOrders = [
    Order(
      title: 'اندومي',
      status: 'تم التوصيل',
      price: 25,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      title: 'بيتزا',
      status: 'تم التوصيل',
      price: 85,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      title: 'كنافة نابلسي',
      status: 'تم التوصيل',
      price: 75,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      title: 'كب كيك',
      status: 'تم التوصيل',
      price: 65,
      date: DateTime.now(),
      imageUrl: '',
    ),
    Order(
      title: 'لحمة',
      status: 'تم التوصيل',
      price: 25,
      date: DateTime.now(),
      imageUrl: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
      ),
      appBar: AppBar(
        title: Text('الطلبات'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemCount: myOrders.length,
              itemBuilder: (ctx, i) => OrderItem(
                  title: myOrders[i].title,
                  imageUrl: myOrders[i].imageUrl,
                  date: myOrders[i].date,
                  price: myOrders[i].price,
                  status: myOrders[i].status))),
    );
  }
}
