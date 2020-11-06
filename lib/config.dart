import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/screens/home_screen.dart';

class Config {
  static Widget buildBottomNavigationBar(
      {bool isSignup = false,
      @required Size mediaQuery,
      BuildContext context}) {
    return Container(
      height: mediaQuery.height * 0.08,
      width: mediaQuery.width,
      color: Color(0xffF4AC94),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSignup
              ? Container()
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.home,
                    size: mediaQuery.height * 0.05,
                    color: Colors.white,
                  ),
                ),
          isSignup
              ? Container()
              : IconButton(
                onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     pageBuilder: (_, __, ___) => HomeScreen(),
                    //   ),
                    // );
                  },
                  icon: Icon(
                    FontAwesomeIcons.listAlt,
                    size: mediaQuery.height * 0.05,
                    color: Colors.white,
                  ),
                ),
          Image.asset('images/bottomBar.JPG'),
          isSignup
              ? Container()
              : IconButton(
                onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     pageBuilder: (_, __, ___) => HomeScreen(),
                    //   ),
                    // );
                  },
                  icon: Icon(
                    Icons.person,
                    size: mediaQuery.height * 0.05,
                    color: Colors.white,
                  ),
                ),
          isSignup
              ? Container()
              : IconButton(
                onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     pageBuilder: (_, __, ___) => HomeScreen(),
                    //   ),
                    // );
                  },
                  icon: Icon(
                    Icons.settings,
                    size: mediaQuery.height * 0.05,
                    color: Colors.white,
                  ),
                ),
        ].reversed.toList(),
      ),
    );
  }
}
