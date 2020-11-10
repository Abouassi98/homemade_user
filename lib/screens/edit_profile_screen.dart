import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
      ),
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Center(
                    child: CircleAvatar(
                      radius: mediaQuery.height * 0.08,
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'الاسم',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  color: Color(0xffF4AC94),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'رقم الجوال',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  color: Color(0xffF4AC94),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'البريد الالكتروني',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  color: Color(0xffF4AC94),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.2,
                ),
                Center(
                  child: Container(
                    width: mediaQuery.width * 0.3,
                    child: RaisedButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'تحديث',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
