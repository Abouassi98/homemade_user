import 'package:flutter/material.dart';
import 'package:homemade_user/screens/order_list_screen.dart';
import '../config.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Theme.of(context).primaryColor,
                height: mediaQuery.height * 0.13,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.06,
              right: mediaQuery.width * 0.05,
              left: mediaQuery.width * 0.68,
              child: CircleAvatar(
                radius: mediaQuery.height * 0.09,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: mediaQuery.height * 0.08,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.15,
              right: mediaQuery.width * 0.35,
              left: mediaQuery.width * 0.28,
              child: Text(
                'اسم العميل',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.29,
              left: mediaQuery.width * 0.03,
              right: mediaQuery.width * 0.03,
              bottom: mediaQuery.height * 0.02,
              child: Column(
                children: [
                  Config.buildCardContainer(
                      mediaQuery: mediaQuery, cardTitle: 'الملف الشخصي'),
                  Config.buildCardContainer(
                      mediaQuery: mediaQuery, cardTitle: 'العناوين'),
                  Config.buildCardContainer(
                      mediaQuery: mediaQuery, cardTitle: 'المحفظة'),
                  Config.buildCardContainer(
                    onPressed:(){
                       Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => OrderListScreen(),
                      ),
                    );
                    },
                      mediaQuery: mediaQuery, cardTitle: 'عدد الطلبات'),
                  Config.buildCardContainer(
                      mediaQuery: mediaQuery, cardTitle: 'الكوبونات'),
                  Config.buildCardContainer(
                      mediaQuery: mediaQuery,
                      cardTitle: 'تواصل معنا عبر تيليجرام'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}