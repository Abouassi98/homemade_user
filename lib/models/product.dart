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
class Products {
    Products({
        @required this.mainCode,
        @required this.code,
        @required this.data,
        @required this.error,
    });

    final int mainCode;
    final int code;
    final List<Datum> data;
    final dynamic error;
}

class Datum {
    Datum({
        @required this.id,
        @required this.name,
        @required this.details,
        @required this.preparationTime,
        @required this.price,
        @required this.views,
        @required this.rate,
        @required this.typeId,
        @required this.categoryId,
        @required this.categoryName,
        @required this.providerId,
        @required this.providerName,
        @required this.createdAt,
        @required this.mainAdditions,
        @required this.moreAdditions,
        @required this.images,
    });

    final int id;
    final String name;
    final String details;
    final int preparationTime;
    final int price;
    final int views;
    final double rate;
    final int typeId;
    final int categoryId;
    final String categoryName;
    final int providerId;
    final String providerName;
    final String createdAt;
    final List<Addition> mainAdditions;
    final List<Addition> moreAdditions;
    final List<Image> images;
}

class Image {
    Image({
        @required this.id,
        @required this.image,
    });

    final int id;
    final String image;
}

class Addition {
    Addition({
        @required this.id,
        @required this.name,
        @required this.price,
    });

    final int id;
    final String name;
    final int price;
}
