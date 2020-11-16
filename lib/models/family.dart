import 'package:flutter/foundation.dart';

class Family {
  final String name;
  final String category;
  final String imageUrl;
  final int orderCount;
  final double rating;
  final int distance;
  Family({
    @required this.name,
    @required this.category,
    @required this.orderCount,
    @required this.rating,
    @required this.distance,
    @required this.imageUrl,
  });
}
class Distance{
  final double latitude;
  final double longitude;
  Distance({
    @required this.latitude,
    @required this.longitude,
  });
}
