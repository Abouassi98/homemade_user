import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String status;
  final DateTime date;
  final int price;
  OrderItem({
    @required this.title,
    @required this.imageUrl,
    @required this.date,
    @required this.price,
    @required this.status,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: 3,
        bottom: 3,
      ),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      width: double.infinity,
      height: mediaQuery.height * 0.16,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xffFCE8E6),
          ),
          top: BorderSide(
            width: 2.0,
            color: Color(0xffFCE8E6),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: mediaQuery.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff366775)),
                    ),
                    Spacer(),
                    Text('$price ريال',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff366775)),),
                    
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Text(
                'حالة الطلب : $status',
                textAlign: TextAlign.end,
                style: TextStyle(color: Color(0xff366775)),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Container(
                width: mediaQuery.width * 0.67,
                child: Row(
                  children: [
                    Text(
                      '٢٠٢٠/ ٨/ ١٠ الاثنين',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Color(0xff366775)),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: mediaQuery.width * 0.07,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.transparent,
                elevation: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/homemade_logo.PNG',
                    height: mediaQuery.height * 0.13,
                    width: mediaQuery.width * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ].reversed.toList(),
      ),
    );
  }
}
