import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/order_details_screen.dart';
import 'package:homemade_user/widgets/driver_item.dart';
import '../models/driver.dart';
import '../widgets/google_maps_item.dart';

class DriverSearchScreen extends StatefulWidget {
  @override
  _DriverSearchScreenState createState() => _DriverSearchScreenState();
}

class _DriverSearchScreenState extends State<DriverSearchScreen> {
  List<Driver> drivers = [
    Driver(
        driverName: 'ممدوح',
        delivringPrice: 20,
        rating: 2.5,
        latitude: 0.0,
        longitude: 0.0),
    Driver(
        driverName: 'محمد',
        delivringPrice: 10,
        rating: 4.5,
        latitude: 0.0,
        longitude: 0.0),
    Driver(
        driverName: 'احمد',
        delivringPrice: 20,
        rating: 4.0,
        latitude: 0.0,
        longitude: 0.0),
    Driver(
        driverName: 'محمود',
        delivringPrice: 20,
        rating: 3.5,
        latitude: 0.0,
        longitude: 0.0),
    Driver(
        driverName: 'صالح',
        delivringPrice: 20,
        rating: 3.0,
        latitude: 0.0,
        longitude: 0.0),
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
        title: Text('البحث عن مندوبين'),
        centerTitle: true,
        backgroundColor: Color(0xffD66D50),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xffD66D22),
              height: mediaQuery.height * 0.45,
              width: double.infinity,
              child: GoogleMapsItem(),
            ),
            SizedBox(
              height: mediaQuery.height * 0.01,
            ),
            Container(
              height: mediaQuery.height * 0.33,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: drivers.length,
                itemBuilder: (ctx, i) => DriverItem(
                    driverName: drivers[i].driverName,
                    rating: drivers[i].rating,
                    deliveringPrice: drivers[i].delivringPrice,
                    onAccept: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => OrderDetailsScreen(),
                        ),
                      );
                    },
                    onRefuse: () {
                      setState(() {
                        drivers.removeAt(i);
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
