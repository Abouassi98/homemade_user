import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/firebaseNotifications.dart';
import '../widgets/BouncyPageRoute.dart';

import './signup_or_login_screen.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;

  const Splash({Key key, this.navigator}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Future<Timer> _loadData() async {
    return Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(BouncyPageRoute(widget: SignupOrLoginScreen()));
    });
  }

  @override
  void initState() {
    _loadData();
    FirebaseNotifications().setUpFirebase(widget.navigator);
    super.initState();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Color(0xffFCE8E6),
      body: Stack(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/homemadelogo.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .8),
              child: Shimmer.fromColors(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "هوم ميد",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        " مرحبا بكم في تطبيق ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  baseColor: Colors.black,
                  highlightColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
