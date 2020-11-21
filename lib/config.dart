import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/screens/personal_data_screen.dart';
import 'package:homemade_user/screens/home_screen.dart';
import 'package:homemade_user/screens/order_list_screen.dart';
import 'package:homemade_user/screens/settings_screen.dart';

// import 'package:homemade_user/screens/home_screen.dart';
// import 'package:homemade_user/screens/order_list_screen.dart';
// import 'package:homemade_user/screens/settings_screen.dart';
enum OrderTab {
  Applicable,
  Scheduled,
  Completed,
}

class Config {
  static Widget buildCardContainer({
    Size mediaQuery,
    String cardTitle,
    Function onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          width: double.infinity,
          height: mediaQuery.height * 0.08,
          //  color: Color(0xffF3AB93),
          decoration: BoxDecoration(
            color: Color(0xffF3AB93),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildTextFormField({
    TextInputType type,
    TextEditingController controller,
    Key key,
    Color color,
    String hintText,
    void Function(String value) onChanged,
    String Function(String value) validator,
    bool defaultColor = false,
    bool centered = false,
    bool enabled = true,
    bool secureText = false,
    Widget suffixIcon,
    String initialValue,
  }) {
    return Container(
      // height: 50,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: TextFormField(
          initialValue: initialValue ?? '',
          style: (type == TextInputType.number || type == TextInputType.phone)
              ? TextStyle(
                  fontFamily: 'Acme',
                  color: defaultColor ? Color(0xff366775) : Color(0xffF3AB93),
                )
              : null,
          obscureText: secureText,
          keyboardType: type,
          key: key,
          controller: controller,
          enabled: enabled,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(vertical: 3, horizontal: centered ? 0 : 9),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color == null ? Colors.white : color,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'HomeMade',
              color: defaultColor ? Color(0xff366775) : Color(0xffF3AB93),
              fontSize: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color == null ? Colors.white : color,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color == null ? Colors.white : color,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildContainer({
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
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => OrderListScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.fileAlt,
                    size: mediaQuery.height * 0.05,
                    color: Colors.white,
                  ),
                ),
          Image.asset('images/bottomBar.JPG'),
          isSignup
              ? Container()
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => PersonalDataScreen(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SettingsScreen(),
                      ),
                    );
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
