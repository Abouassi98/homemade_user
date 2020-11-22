import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductItem extends StatelessWidget {
  final String prodTitle;
  final String description;
  final double rating;
  final int price;
  final String imageUrl;
  ProductItem({
    this.prodTitle,
    this.description,
    this.price,
    this.rating,
    this.imageUrl,
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
      height: mediaQuery.height * 0.19,
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            color: Colors.transparent,
            elevation: 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: mediaQuery.height * 0.18,
                width: mediaQuery.width * 0.23,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: mediaQuery.width * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          prodTitle,
                          style: TextStyle(
                            color: Color(0xff366775),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Spacer(),
                        SmoothStarRating(
                          color: Color(0xffFFC757),
                          isReadOnly: true,
                          size: 15,
                          rating: rating,
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Text(
                      'الوصف: $description',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xff366775), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: mediaQuery.width * 0.48,
                  ),
                  Chip(
                    backgroundColor: Color(0xffF4AC94),
                    label: Text('السعر: $price'),
                    labelStyle: TextStyle(
                      fontFamily: 'HomeMade',
                      color: Color(0xff366775),
                    ),
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
