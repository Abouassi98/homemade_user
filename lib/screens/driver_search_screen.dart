import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/order_details_screen.dart';
import 'package:homemade_user/widgets/driver_item.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import '../screens/home_screen.dart';
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

  Future<bool> _onBackPressed() {
    return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('هل أنت متأكد'),
            content: new Text('سوف يتم إلغاء الطلب'),
            actions: <Widget>[
              new RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  "متابعة الطلب",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 16),
              new RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color(0xffD66D50),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  "الخروج",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: Config.buildBottomNavigationBar(
          mediaQuery: mediaQuery,
          context: context,
          isSignup: true,
        ),
        appBar: AppBar(
          title: Text('البحث عن مندوبين'),
          centerTitle: true,
          backgroundColor: Color(0xffD66D50),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Color(0xffD66D22),
                height: mediaQuery.height * 0.343,
                width: double.infinity,
                child: GoogleMapsItem(),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Container(
                height: mediaQuery.height * 0.05,
                width: mediaQuery.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffF3AB93),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ':سوف يتم إلغاء الطلب خلال',
                      textDirection: TextDirection.ltr,
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.02,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SlideCountdownClock(
                        duration: Duration(minutes: 5),
                        slideDirection: SlideDirection.Down,
                        tightLabel: true,
                        onDone: () {
                          Fluttertoast.showToast(
                              msg: 'تم إالغاء الطلب, يرجى الإعادة مرة أخرى');
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => HomeScreen()),
                          );
                        },
                        separator: ":",
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Container(
                height: mediaQuery.height * 0.37,
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
      ),
    );
  }

  @override
  void dispose() {
    Navigator.of(context).deactivate();

    super.dispose();
  }
}
