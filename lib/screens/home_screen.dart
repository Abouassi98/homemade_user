import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/providers/products/products.dart';
import 'package:homemade_user/screens/meals_overview_screen.dart';
import 'package:homemade_user/screens/myPlaces/pickPlace.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/place.dart';
import 'package:provider/provider.dart';
import '../widgets/buttonSignIn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _fromTop = true;
  SharedPreferences prefs;
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

  List<Place> places = [
    Place(addressTitle: 'المنزل', addressDetails: 'الدمام'),
    Place(addressTitle: 'منزل صديق', addressDetails: 'الرياض'),
    Place(addressTitle: 'العمل', addressDetails: 'جدة'),
  ];
  
  List<String> addressDetails = [
    'الرياض',
    'الدمام',
    'جدة',
  ];
  var address = '';
  var isInit = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      prefs = await SharedPreferences.getInstance();
    }
    super.didChangeDependencies();
  }

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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: mediaQuery.height * 0.285,
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
                  SizedBox(
                    height: mediaQuery.height * 0.025,
                  ),
                  Image.asset(
                    'images/location_logo.PNG',
                    height: mediaQuery.height * 0.17,
                    width: mediaQuery.width,
                  ),
                  // SizedBox(
                  //   height: mediaQuery.height * 0.02,
                  // ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context,builder: (ctx)=>Container(
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
                                      height: 250,
                                      child: ListView(
                                        children: places
                                            .map(
                                              (e) => RadioListTile(
                                                value: e.addressTitle,
                                                groupValue:  address,
                                                onChanged: (value) {
                                                  setState(() {
                                                    address = e.addressTitle;
                                                  });
                                                  print(address);
                                                  Navigator.of(context).pop();
                                                },
                                                title: Text(
                                                  e.addressTitle,
                                                ),
                                                subtitle:
                                                    Text(e.addressDetails),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      
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
                              ),);
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
                          Icon(
                            FontAwesomeIcons.search,
                            color: Colors.grey,
                          ),
                          Text(
                            'التوصيل لـ $address',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff366775),
                            ),
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
                      Provider.of<ProductsProvider>(context, listen: false)
                          .orderType(true);
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MealsOverviewScreen(filterType: 1),
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
                      Provider.of<ProductsProvider>(context, listen: false)
                          .orderType(false);

                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MealsOverviewScreen(filterType: 2),
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
    );
  }
}
