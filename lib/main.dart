import 'package:flutter/material.dart';
import 'package:homemade_user/helper/map_helper.dart';
import 'package:homemade_user/models/auth/phoneVerificationModel.dart';
import 'package:homemade_user/providers/auth/confirmResetCodeProvider.dart';
import 'package:homemade_user/providers/auth/phoneVerificationProvider.dart';
import 'package:homemade_user/providers/changeData/changePhoneCodeProvider.dart';
import 'screens/signup_or_login_screen.dart';
import 'package:provider/provider.dart';
import './providers/products/products.dart';
import './providers/families/families.dart';
import './providers/AboutUsProvider.dart';
import './providers/TermsProvider.dart';
import './screens/home_screen.dart';
import './screens/splash_screen.dart';
import './screens/signup_screen.dart';
import './screens/settings_screen.dart';
import 'screens/personal_data_screen.dart';
import 'screens/order_details_screen.dart';
import 'screens/order_summary_screen.dart';
import 'screens/finished_order_screen.dart';
import './screens/family_details_screen.dart';
import './screens/driver_search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Families(),
          // value: Products(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HomeMade',
        theme: ThemeData(
          fontFamily: 'HomeMade',
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color(0xff366775),
          textTheme: TextTheme(),

          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: ProductsProvider(),
            ),
            ChangeNotifierProvider.value(
              value: ConfirmResetCodeProvider(),
            ),
            ChangeNotifierProvider.value(
              value: PhoneVerificationProvider(),
            ),
            ChangeNotifierProvider.value(
              value: ChangePhoneCodeProvider(),
            ),
            ChangeNotifierProvider.value(
              value: Families(),
              // value: Products(),
            ),
            ChangeNotifierProvider.value(
              value: MapHelper(),
            ),
            ChangeNotifierProvider.value(
              value: AboutUsProvider(),
            ),
            ChangeNotifierProvider.value(
              value: TermsProvider(),
            ),
          ],
          child: Splash(),
        ),
      ),
    );
  }
}
