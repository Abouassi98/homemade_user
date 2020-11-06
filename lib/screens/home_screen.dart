import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/meals_overview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildOrderCard({
    @required String imagePath,
    @required String buttonTitle,
    @required Function onPressed,
    @required Size mediaQuery,
  }) {
    return Container(
      width: mediaQuery.width * 0.7,
      height: mediaQuery.height * 0.3,
      decoration: BoxDecoration(
        color: Color(0xffFCE8E6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: mediaQuery.height * 0.2,
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            height: mediaQuery.height * 0.06,
            width: mediaQuery.width * 0.7,
            child: RaisedButton(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: onPressed,
              color: Color(0xffF4AC94),
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: Color(0xff366775),
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(bottomNavigationBar: Config.buildBottomNavigationBar(
          mediaQuery: mediaQuery,
          context: context,
        ),
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: mediaQuery.height * 0.28,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff366775),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/location_logo.PNG',
                      height: mediaQuery.height * 0.14,
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: mediaQuery.width * 0.9,
                      height: mediaQuery.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'التوصيل لـ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff366775),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.search,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.29,
              left: mediaQuery.height * 0.05,
              right: mediaQuery.height * 0.05,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildOrderCard(
                      imagePath: 'images/urgent_order.PNG',
                      buttonTitle: 'اطلب الآن',
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => MealsOverviewScreen(),
                          ),
                        );
                      },
                      mediaQuery: mediaQuery,
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    buildOrderCard(
                      imagePath: 'images/scheduled_order.PNG',
                      buttonTitle: 'اطلب الآن واستلم لاحقاً',
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => MealsOverviewScreen(),
                          ),
                        );
                      },

                      mediaQuery: mediaQuery,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
