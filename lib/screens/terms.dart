import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/termsProvider.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

class TermsApp extends StatefulWidget {
  @override
  _TermsAppState createState() => _TermsAppState();
}

class _TermsAppState extends State<TermsApp> {
  _launchURL() async {
    const url = 'https://tqnee.com.sa';
    launch(url);
  }

  @override
  void initState() {
    super.initState();
  //  Future.delayed(
  //    Duration(seconds:2),
  //    () async{
  //     await  Provider.of<TermsProvider>(context, listen: false).getTerms();
  //    }
  //  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "الشروط والاحكام",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body:
      //  Provider.of<TermsProvider>(
      //           context,
      //         ).content ==
      //         null
      //     ? SpinKitThreeBounce(
      //         color: Theme.of(context).primaryColor,
      //         size: 22,
      //       )
          // : 
          Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40.0,
                  ),
                  child: ListView(
                    children: <Widget>[
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 20, top: 8),
                          child: Text(
                           'الشروط والأحكام الشروط والأحكام الشروط والأحكام الشروط والأحكام الشروط والأحكام الشروط والأحكام',
                            // "${Provider.of<TermsProvider>(context, listen: false).content}",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: InkWell(
                      onTap: _launchURL,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'تصميم وتنفيذ تقني لتقنية المعملومات',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12),
                          )),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
