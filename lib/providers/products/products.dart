import 'package:flutter/foundation.dart';
import 'package:homemade_user/models/product.dart';

class Products with ChangeNotifier {
  List<Product> items = [
    Product(
        description: 'شعرية سريعة التحضير لكل الناس',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'اندومي',
        rating: 4),
    Product(
        description: 'كنافة عربي لفطار لذيذ',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'كنافة نابلسي',
        rating: 3),
    Product(
        description: 'فطار مصري للصغار والشطار',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'فول مصري',
        rating: 4.5),
    Product(
        description: 'كب كيك بنكهة الريدفيلفيت',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'كب كيك',
        rating: 3.5),
  ];
}
