import 'package:flutter/foundation.dart';

class Families {
  final String name;
  final String category;
  final String imageUrl;
  final int orderCount;
  final double rating;
  final int directions;
  Families({
    @required this.name,
    @required this.category,
    @required this.orderCount,
    @required this.rating,
    @required this.directions,
    @required this.imageUrl,
  });
}
