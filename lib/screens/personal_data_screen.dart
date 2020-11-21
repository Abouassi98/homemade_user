import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config.dart';

class PersonalDataScreen extends StatefulWidget {
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
 
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          'الملف الشخصي',
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
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
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  color: Color(0xffFCE8E6),
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
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  color: Color(0xffFCE8E6),
                ),
            
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Center(
                  child: Container(
                    width: mediaQuery.width * 0.7,
                    child: RaisedButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'تحديث بيانات المستخدم',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
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
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  type: TextInputType.number,
                  color: Color(0xffFCE8E6),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Center(
                  child: Container(
                    width: mediaQuery.width * 0.7,
                    child: RaisedButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'تحديث رقم الجوال',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'كلمة السر',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  secureText: true,
                  color: Color(0xffFCE8E6),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'كلمة السر الجديدة',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  secureText: true,
                  color: Color(0xffFCE8E6),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    'تأكيد كلمة السر الجديدة',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                Config.buildTextFormField(
                  secureText: true,
                  color: Color(0xffFCE8E6),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
                Center(
                  child: Container(
                    width: mediaQuery.width * 0.7,
                    child: RaisedButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'تحديث',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
