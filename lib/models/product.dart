import 'package:flutter/foundation.dart';

class Family {
  final String imageUrl;

  final String familyName;
  final String description;
  final DateTime openingHour;
  final DateTime closingHour;
  final String status;
  Family({
    this.familyName,
    this.imageUrl,
    this.closingHour,
    this.description,
    this.openingHour,
    this.status,
  });
}

class Product {
  final double rating;
  final String imageUrl;
  final String productName;
  final String description;

  final int price;
  Product({
    this.rating,
    this.productName,
    this.description,
    
    this.price,
    this.imageUrl,
  });
}
