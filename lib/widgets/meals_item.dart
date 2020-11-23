import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MealsItem extends StatelessWidget {
  final String shopLogo;
  final String title;
  final String category;
  final int orderCount;
  final int directions;
  final double rating;
  final bool isAvailable;
  MealsItem({
    @required this.shopLogo,
    @required this.title,
    @required this.category,
    @required this.orderCount,
    @required this.directions,
    @required this.rating,
    @required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
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
                        SmoothStarRating(
                          size: 15,
                          color: Color(0xffFFC757),
                          rating: rating,
                          isReadOnly: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Text(
                    category,
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
                          'عدد الطلبات: $orderCount طلب',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Color(0xff366775)),
                        ),
                        Spacer(),
                        Text(
                          'المسافة: $directions كم',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Color(0xff366775)),
                        ),
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
        ),
       isAvailable? Container(): Positioned(
          top: mediaQuery.height * 0.08,
          bottom: mediaQuery.height * 0.005,
          left: 0,
          right: mediaQuery.width * 0.6,
          child: Container(
            padding: EdgeInsets.all(7),
            color: Colors.red[50].withOpacity(0.85),
            height: mediaQuery.height * 0.2,
            width: double.infinity,
            child: Text(
              'الأسرة في غير ساعات العمل الآن!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
