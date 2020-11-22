import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DriverItem extends StatelessWidget {
  final String driverName;
  final double rating;
  final int deliveringPrice;
  final Function onAccept;
  final Function onRefuse;
  DriverItem({
    @required this.driverName,
    @required this.rating,
    @required this.deliveringPrice,
    @required this.onAccept,
    @required this.onRefuse,
  });
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: mediaQuery.height * 0.04,
            backgroundImage: AssetImage('images/profile.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driverName,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              SmoothStarRating(
                rating: rating,
                isReadOnly: false,
                size: 15,
                color: Color(0xffFFC757),
              )
            ],
          ),
          SizedBox(
            width: mediaQuery.width * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سعر التوصيل : $deliveringPrice ريال',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: mediaQuery.height * 0.03,
                    width: mediaQuery.width * 0.17,
                    child: RaisedButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      onPressed: onAccept,
                      child: Text(
                        'قبول',
                        style: TextStyle(fontSize: 12),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.03,
                  ),
                  Container(
                    height: mediaQuery.height * 0.03,
                    width: mediaQuery.width * 0.17,
                    child: RaisedButton(
                      elevation: 8,
                      color: Color(0xffD66D50),
                      child: Text(
                        'رفض',
                        style: TextStyle(fontSize: 12),
                     ),
                      onPressed: onRefuse,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
