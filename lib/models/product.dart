import 'package:flutter/foundation.dart';

enum ProductType {
  Urgent,
  Scheduled,
}

class Family {
  final String imageUrl;
  final String familyId;
  final int familyName;
  final String description;
  final DateTime openingHour;
  final DateTime closingHour;
  final String status;
  Family({
    this.familyId,
    this.familyName,
    this.imageUrl,
    this.closingHour,
    this.description,
    this.openingHour,
    this.status,
  });
}

class Product {
  final int productId;
  final double rating;
  final String imageUrl;
  final String category;
  final String productName;
  final String description;
  final ProductType productType;

  final int price;
  Product({
    this.productId,
    this.rating,
    this.productName,
    this.description,
    this.price,
    this.imageUrl,
    this.productType,
    this.category,
  });
}
