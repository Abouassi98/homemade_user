import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/providers/products/products.dart';
import 'package:homemade_user/screens/meals_overview_screen.dart';
import 'package:homemade_user/screens/myPlaces/pickPlace.dart';
import 'package:provider/provider.dart';
import '../widgets/buttonSignIn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _fromTop = true;
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
              child: Container(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    color: Color(0xff366775),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> places = [
    'المنزل',
    'منزل صديق',
    'العمل',
  ];
  List<String> addressDetails = [
    'الرياض',
    'الدمام',
    'جدة',
  ];
  var address = '';
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    print(mediaQuery.width);
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
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
                      height: mediaQuery.height * 0.19,
                      width: mediaQuery.width,
                    ),
                    // SizedBox(
                    //   height: mediaQuery.height * 0.02,
                    // ),
                    InkWell(
                      onTap: () {
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return Align(
                              alignment: _fromTop
                                  ? Alignment.topCenter
                                  : Alignment.bottomCenter,
                              child: Material(
                                child: Container(
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 300,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: places.length,
                                            itemBuilder: (_, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    address = places[index];
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Column(
                                                  children: [
                                                    Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: TextField(
                                                        cursorColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                        readOnly: true,
                                                        onTap: () {},
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    places[
                                                                        index],
                                                                errorText:
                                                                    addressDetails[
                                                                        index],
                                                                errorStyle: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400],
                                                                    fontSize:
                                                                        16),
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16),
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                prefixIcon:
                                                                    Material(
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            30),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            25,
                                                                        vertical:
                                                                            13)),
                                                      ),
                                                    ),
                                                    Divider()
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SignInButton(
                                          txtColor: Colors.white,
                                          onPressSignIn: () {
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    PickPlace(),
                                              ),
                                            );
                                          },
                                          iconData: Icons
                                              .arrow_drop_down_circle_outlined,
                                          btnWidth:
                                              MediaQuery.of(context).size.width,
                                          btnHeight: 45,
                                          btnColor: Colors.red,
                                          iColor: Colors.white,
                                          buttonText: 'عنوان جديد',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                                position: Tween(
                                        begin: Offset(0, _fromTop ? -1 : 1),
                                        end: Offset(0, 0.2))
                                    .animate(anim1),
                                child: child);
                          },
                        );
                      },
                      child: Container(
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
                              'التوصيل لـ $address',
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
                        Provider.of<Products>(context, listen: false)
                            .orderType(true);
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
                        Provider.of<Products>(context, listen: false)
                            .orderType(false);

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
